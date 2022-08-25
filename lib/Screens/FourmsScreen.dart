import 'package:flutter/material.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_app/Cubit/StatesApp.dart';
import 'package:lavie_app/Shard/utils/AppColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Shard/widgets/Widgets.dart';
class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, StatesApp>(builder: (context, state) {
      return ConditionalBuilder(
        builder: (context){
          int? countFourms = CubitApp.get(context).forums?.data.length;
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -150,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Form(child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: "Search",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            )
                        ),
                        controller: CubitApp.get(context).searchForums,
                        onEditingComplete: (){
                          CubitApp.get(context).getSearchForums(CubitApp.get(context).searchForums.text);
                        },
                      )
                    ],
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  categoriesWidget(context),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(itemBuilder: (context , index){
                        return Container(

                          padding: EdgeInsets.symmetric(

                          ),
                          decoration: BoxDecoration(
                              color: Colors.white

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Padding(padding: EdgeInsets.all(10) , child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 23,
                                        child: CachedNetworkImage(
                                          imageUrl:  "${CubitApp.get(context).forums?.data?[index].userForums.imageUrl}",
                                          placeholder: (context, url) => Container(
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                          fit: BoxFit.fitHeight,
                                          height: 100,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:280,
                                            child: Text(
                                              "${CubitApp.get(context).forums?.data?[index].userForums.firstName} ${CubitApp.get(context).forums?.data?[index].userForums.lastName}",
                                              style: TextStyle(
                                                color: Colors.black, fontSize: 18,
                                              ) ,
                                              maxLines: 2,

                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          customText(text: "8 minutes", color: Color(0xff979797), fontSize: 15)
                                        ],
                                      )
                                    ],
                                  )),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          customText(text: "${CubitApp.get(context).forums?.data?[index].title}", color: AppColors.primary, fontSize: 20),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          customText(text: "${CubitApp.get(context).forums?.data?[index].description}", color: Color(0xff8F8D8D), fontSize: 12),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    )],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xffE5E5E5))
                                ),
                              ),
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl:  "https://lavie.orangedigitalcenteregypt.com${CubitApp.get(context).forums?.data?[index].imageUrl}",
                                  fit:BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    height: 200,
                                    child: Center(child: CircularProgressIndicator()),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(onPressed: ()=>{}, icon:Icon( Icons.thumb_up_off_alt , size: 35, color: Color(0xff666565))),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      customText(text: "${CubitApp.get(context).forums?.data?[index].forumLikes.length} Likes", color: Color(0xff666565), fontSize: 20),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      customText(text: "${CubitApp.get(context).forums?.data?[index].forumComments.length} Replies", color: Color(0xff666565), fontSize: 20)
                                    ],
                                  ),

                                ],
                              ),

                            ],
                          ),
                        );
                      },separatorBuilder: (context , index){
                        return SizedBox(
                          height: 20,
                        );
                      }, itemCount: countFourms!),
                    ),
                  )
                ],
              ),
            ),
          );


        }, condition: state is! StateForumsLoading && CubitApp.get(context).forums?.data != null,
        fallback: (context){
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      );
    }, listener: (context, state) {
           print("state=== ${state}");

           if(state is StateGetCurrentUserError){
             print(state.message);
           }
    });
  }

  Widget categoriesWidget(BuildContext context ){
    return Container(
      height: 50,
      child: ListView(
        children: [
          GestureDetector(
            onTap: (){
              CubitApp.get(context).changeIndexForums(0);
              CubitApp.get(context).getForums("all");
            },
            child: Container(
              width: 150,
              child: Center(child: customText(text: "All Forms", color: CubitApp.get(context).indexForums == 0 ? Colors.white : Color(0xff979797), fontSize: 18)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CubitApp.get(context).indexForums == 0 ? AppColors.primary : Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: (){

              CubitApp.get(context).changeIndexForums(1);
              CubitApp.get(context).getForums('me');

            },
            child: Container(
              width: 150,
              child: Center(child: customText(text: "My Forums", color: CubitApp.get(context).indexForums == 1 ? Colors.white : Color(0xff979797), fontSize: 18)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CubitApp.get(context).indexForums == 1 ? AppColors.primary : Colors.white,
              ),
            ),
          )
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

}
