import 'package:flutter/widgets.dart';
import 'package:lavie_app/Cubit/StatesApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_app/Models/CurrentUser.dart';
import 'package:lavie_app/Models/Forums.dart';
import 'package:lavie_app/Models/User.dart';
import 'package:lavie_app/Screens/HomeScreen.dart';
import 'package:lavie_app/Screens/NotificationScreen.dart';
import 'package:lavie_app/Screens/ProfileScreen.dart';
import 'package:lavie_app/Screens/ScanScreen.dart';
import 'package:lavie_app/Screens/FourmsScreen.dart';
import 'package:lavie_app/Shard/local/CacheHelper.dart';
import 'package:image_picker/image_picker.dart';
import '../Shard/network/DioHelper.dart';
import 'dart:convert';
import 'dart:io' as Io;
import 'dart:math';
import 'dart:typed_data';

class CubitApp extends Cubit<StatesApp>{
  CubitApp() : super(AppStatesInit());
  static CubitApp get(context) => BlocProvider.of(context);
  final ImagePicker imgPicker = ImagePicker();
  dynamic imagePathPost = "";
  String imagePost = "";
  int indexForums= 0;
  int bottomNavIndex= 0;
  int indexCategory = 0;
  List categories = ["All" , "Plants" , "Seeds" , "Tools"];
  TextEditingController searchForums = TextEditingController();

  List<Map<String,dynamic>> screens = [
    {
      "page" :   ForumsScreen(),
      "name" : "Discussion Forums"
    },
    {
      "page" : ScanScreen(),
      "name" : "Scan"
    },
    {
      "page" :   HomeScreen(),
      "name" : "Home"
    },
    {
      "page" :  NotificationScreen(),
      "name" : "Notification"
    },
    {
     "page" : ProfileScreen(),
      "name" : "Profile"
    }
  ];
  Forums? forums;
  CurrentUser? currentUser;

  void changeNavBottom(index){
    bottomNavIndex = index;
    emit(StatesChangeNavBottom());
  }

  void changeNavCategory(index){
    indexCategory = index;
    emit(StatesChangeCategory());
  }

  void changeIndexForums(index){
    indexForums = index;
    emit(StatesIndexForums());
  }

  User? user;
  UserError? userError;

  void register({required String firstName, required String lastName, required String email, required password }){

    emit(StateRegisterLoading());
    DioHelper.postData(path: '/api/v1/auth/signup',
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password
        }).then((value) {

      if(value.statusCode == 200){

        user = User.fromJson(value.data);
        emit(StateRegisterSuccess(user!));
      }else if(value.statusCode == 400 || value.statusCode == 409){
         userError = UserError.fromJson(value.data);
         emit(StateRegisterError(userError!));
      }
    }).catchError((err){

    });

  }

  void login({required String email ,required String password}){

    emit(StateLoginLoading());
    DioHelper.postData(path: "/api/v1/auth/signin" , data: {
      "email": email,
      "password": password
    }).then((value){

      if(value.statusCode == 200)
      {
        CacheHelper.setData(key: "token", value: value.data['data']["accessToken"]);
        user = User.fromJson(value.data);
        emit(StateLoginSuccess(user!));

      }else if(value.statusCode == 400 ){
        userError = UserError.fromJson(value.data);
        emit(StateRegisterError(userError!));
      }
    }).catchError((err){

    });
  }

  void getCurrentUser(){
    // /api/v1/user/me

    emit(StateGetCurrentUserLoading());
    DioHelper.getData(path: "/api/v1/user/me" , token: CacheHelper.getData(key: "token")).then((value){
      print(value.data);
      if(value.data['statusCode'] == 401){
        emit(StateGetCurrentUserError(value.data['message']));
      }else if(value.statusCode == 200){

        currentUser = CurrentUser.fromJson(value.data);
        emit(StateGetCurrentUserSuccess(user!));
      }

    }).catchError((err){
      print(err);
      emit(StateGetCurrentUserError(err.toString()));
    });
  }

   void getProducts(){

    DioHelper.getData(path: "/api/v1/products" ,token: CacheHelper.getData(key: "token")).then((value){
     if(value.data['statusCode'] == 200)
     {
      print("good ${value.data}");
    }else if(value.data['statusCode'] == 401){
       print("bad ${value.data}");
     }
    }).catchError((err){
    print(err);
   });

  }

  void getForums(String? type){
    emit(StateForumsLoading());
    DioHelper.getData(path: type == "all" ? "/api/v1/forums" : "/api/v1/forums/me" ,token: CacheHelper.getData(key: "token")).then((value){
       // print("forums ${value.data}");
      if(value.statusCode == 200){
        emit(StateForumsLoading());
        forums = Forums.fromJson(value.data);
        emit(StateForumsSuccess(forums!));
      }else if(value.statusCode == 401){
        emit(StateForumsLoading());
        emit(StateForumsError(value.data['message'].toString()));
      }
    }).catchError((err){
      print(err.toString());
      emit(StateForumsError(err.toString()));
    });

  }

  void getSearchForums(String? search){
    emit(StateForumsLoading());
    DioHelper.getData(path:"/api/v1/forums?search=${search}"  ,token: CacheHelper.getData(key: "token")).then((value){

      if(value.statusCode == 200){

        forums = Forums.fromJson(value.data);

        emit(StateForumsSuccess(forums!));
      }else if(value.statusCode == 401){
        emit(StateForumsError(value.data['message'].toString()));
      }
    }).catchError((err){
      emit(StateForumsError(err.toString()));
    });

  }



  void addPost({required String title, required String description, required String image}){

    emit(StateAddPostLoading());
    DioHelper.postData(path: '/api/v1/forums',token: CacheHelper.getData(key: 'token'),
        data: {
          "title"        : title,
          "description"  : description,
          "imageBase64"  : image,
        }).then((value) {

      if(value.statusCode == 200){

        emit(StateAddPostSuccess(value.data['message']));
      }else if(value.statusCode == 400 ){
        emit(StateAddPostError(value.data['message'].toString()));
      }
    }).catchError((err){
      print(err);
    });

  }

  openImage() async {
    try {
      var pickedFile = await imgPicker.pickImage(source: ImageSource.gallery);
      if(pickedFile != null){

         final bytes = Io.File(pickedFile.path).readAsBytesSync();
         String base64Image =  "data:image/png;base64,"+base64Encode(bytes);
         imagePost = base64Image;
         imagePathPost = pickedFile.path;
         print(imagePathPost);
      }else{


        emit(StateAddPostError("No image is selected."));
      }
    }catch (e) {

      emit(StateAddPostError("error while picking file."));
    }
  }


}