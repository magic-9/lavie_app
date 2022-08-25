
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavie_app/Screens/AddPostSceen.dart';
import 'package:lavie_app/Screens/ProfileScreen.dart';
import '../Cubit/CubitApp.dart';
import '../Cubit/StatesApp.dart';
import '../Shard/utils/AppColors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int indexCategory = 0;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (context) => CubitApp()..getDataUser(CacheHelper.getData(key: 'token'))..getDataBook(CacheHelper.getData(key: 'token')),
    //   child: ,
    // );
    return  BlocConsumer<CubitApp, StatesApp>(
      builder: (context, state) {
        return Scaffold(
            appBar: appBar(context),

          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            items: <Widget>[
              Icon(Icons.energy_savings_leaf, size: 30, color: CubitApp
                  .get(context)
                  .bottomNavIndex == 0 ? Colors.white : Colors.black),
              Icon(Icons.qr_code_scanner, size: 30, color: CubitApp
                  .get(context)
                  .bottomNavIndex == 1 ? Colors.white : Colors.black),
              Icon(Icons.home, size: 30, color: CubitApp
                  .get(context)
                  .bottomNavIndex == 2 ? Colors.white : Colors.black),
              Icon(Icons.notifications_none_sharp, size: 30, color: CubitApp
                  .get(context)
                  .bottomNavIndex == 3 ? Colors.white : Colors.black),
              Icon(Icons.person, size: 30, color: CubitApp
                  .get(context)
                  .bottomNavIndex == 4 ? Colors.white : Colors.black),
            ],
            buttonBackgroundColor: AppColors.primary,
            color: Colors.white,
            onTap: (index) {
              CubitApp.get(context).changeNavBottom(index);
            },
          ),
          body: CubitApp.get(context).screens[CubitApp.get(context).bottomNavIndex]['page'],
          floatingActionButton: CubitApp.get(context).bottomNavIndex == 0? FloatingActionButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPostScreen()));
          },
          backgroundColor: AppColors.primary,
            child: Icon(Icons.add, color: Colors.white , size: 25),
          ) : null

        );
      },
      listener: (context, state) {

      },
    );
  }


  AppBar? appBar(context){
    // if(CubitApp.get(context).bottomNavIndex == 4){
    //   return AppBar(
    //     actions: [
    //          IconButton(onPressed: ()=>{}, icon: Icon(Icons.keyboard_backspace))
    //     ],
    //   );
    // }
    if(CubitApp.get(context).bottomNavIndex == 3  || CubitApp.get(context).bottomNavIndex == 0){
      return AppBar(
        centerTitle: true,
        backgroundColor: CubitApp.get(context).screens[CubitApp.get(context).bottomNavIndex]['name'] == "Notification" ? Colors.white : Colors.transparent,
        title: Text("${CubitApp.get(context).screens[CubitApp.get(context).bottomNavIndex]['name']}"),
      );
    }if(CubitApp.get(context).bottomNavIndex == 4 ||CubitApp.get(context).bottomNavIndex == 2 ){
      return null;
    }else{
      return AppBar(
      );
    }
  }

  void floatAction(context){
    if(CubitApp.get(context).bottomNavIndex == 0){
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      );
  }
  }

}