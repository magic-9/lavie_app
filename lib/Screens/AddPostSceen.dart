
import 'dart:io' as Io;
import 'package:flutter/material.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_app/Cubit/StatesApp.dart';
import 'package:lavie_app/Shard/utils/AppColors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../Shard/widgets/Widgets.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,StatesApp>(builder: (context , state){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: customText(color: Colors.black , fontSize: 20 , text: "Create New Post"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(

            child:ConditionalBuilder(

            condition: state is! StateAddPostLoading,
            builder: (context){

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: (){
                      CubitApp.get(context).openImage();
                    },
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primary
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: CubitApp.get(context).imagePathPost == "" ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add , color: AppColors.primary),
                            SizedBox(
                              height: 10,
                            ),
                            customText(text: "Add photo", color: AppColors.primary, fontSize: 20)
                          ],
                        ): Image.file(Io.File(CubitApp.get(context).imagePathPost), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(text: "Title", color: Color(0xff6F6F6F), fontSize: 20),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: title,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0)
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customText(text: "Description", color: Color(0xff6F6F6F), fontSize: 20),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: description,
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0)
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(onPressed: (){
                            print("${CubitApp.get(context).imagePost} ");
                            CubitApp.get(context).addPost(title: title.text, description: description.text, image: CubitApp.get(context).imagePost);
                          }, child: customText(text: "Post", color: Colors.white, fontSize: 20) , style: ElevatedButton.styleFrom(
                              primary: AppColors.primary
                          )),
                        )
                      ],)),
                  )
                ],
              );

            },
            fallback: (context) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                  width: 400,
                  height: 400,
                ),
              );
            }),
          )
      );
    },listener: (context, state){
      if(state is StateAddPostError){
        customToast(
          color: Colors.red,
          message: state.message,
        );
      }else if(state is StateAddPostSuccess){
        title.clear();
        description.clear();
        CubitApp.get(context).imagePathPost = "";
        CubitApp.get(context).imagePost = "";
        customToast(
          color: AppColors.primary,
          message: state.message,
        );
      }
    });
  }





}

