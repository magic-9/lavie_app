import 'package:flutter/material.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_app/Screens/LoginScreen.dart';
import 'package:lavie_app/Shard/local/CacheHelper.dart';
import 'package:lavie_app/Shard/utils/AppColors.dart';
import 'package:lavie_app/Shard/widgets/Widgets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../Cubit/StatesApp.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,StatesApp>(builder: (context ,state){

      return  ConditionalBuilder(
        builder: (context){
          return Column(
            children: [
                 Expanded(
                   child: Container(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                     child: Stack(
                       children: [
                         Positioned(
                           width: MediaQuery.of(context).size.width,
                           height: 250,
                           child: Container(
                           decoration: BoxDecoration(
                               color : Color.fromRGBO(12, 12, 12, 0.8700000047683716),
                               image: DecorationImage(
                                   image: NetworkImage("${CubitApp.get(context).currentUser?.data?.imageUrl}"),
                                   fit: BoxFit.cover,
                                   opacity: 0.2
                               )
                           ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,

                               children: [
                                 CircleAvatar(
                                   radius: 55, // Image radius
                                   backgroundImage: NetworkImage("${CubitApp.get(context).currentUser?.data?.imageUrl}"),
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 customText(text: "${CubitApp.get(context).currentUser?.data?.firstName} ${CubitApp.get(context).currentUser?.data?.lastName}", color: Colors.white, fontSize: 30)
                               ],
                             ),
                         ),),
                         Positioned(
                           top: 230,
                           width: MediaQuery.of(context).size.width,
                           height: 400,
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.white,
                               borderRadius: BorderRadius.circular(20)
                             ),
                             child: Padding(
                               padding: const EdgeInsets.symmetric(
                                 vertical: 10,
                                 horizontal: 20
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     height: 15,
                                   ),
                                   Container(
                                     width: MediaQuery.of(context).size.width,
                                     height: 80,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Color(0xffF3FEF1),
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(10.0),
                                       child: Row(
                                         children: [
                                           Image.asset("assets/images/Group1264.png"),
                                           SizedBox(
                                             width: 10,
                                           ),
                                           customText(text: "You have 30 points", color: Colors.black, fontSize: 20)
                                         ],
                                       ),
                                     ),
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   customText(text: "Edit Profile ", color: Colors.black, fontSize: 19),
                                   SizedBox(
                                     height: 10,
                                   ),
                                   Container(
                                     width: MediaQuery.of(context).size.width,
                                     height: 80,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Colors.white,
                                       boxShadow : [BoxShadow(
                                           color: Color.fromRGBO(108, 107, 107, 0.10000000149011612),
                                           offset: Offset(0,22),
                                           blurRadius: 40
                                       )],
                                       border : Border.all(
                                         color: AppColors.gray.withOpacity(0.5),
                                         width: 1,
                                       ),

                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(10.0),
                                       child:  Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Image.asset("assets/images/icon.png"),
                                           SizedBox(
                                             width: 10,
                                           ),
                                           customText(text: "Change Name", color: Colors.black, fontSize: 20),
                                           Spacer(),
                                           Icon(Icons.arrow_forward_sharp, color: Color(0xff1D592C), size: 35,)
                                         ],
                                       )
                                     ),
                                   ),
                                   SizedBox(
                                     height: 20,
                                   ),
                                   Container(
                                     width: MediaQuery.of(context).size.width,
                                     height: 80,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: Colors.white,
                                       boxShadow : [BoxShadow(
                                           color: Color.fromRGBO(108, 107, 107, 0.10000000149011612),
                                           offset: Offset(0,22),
                                           blurRadius: 40
                                       )],
                                       border : Border.all(
                                         color: AppColors.gray.withOpacity(0.5),
                                         width: 1,
                                       ),

                                     ),
                                     child: Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child:  Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Image.asset("assets/images/icon.png"),
                                             SizedBox(
                                               width: 10,
                                             ),
                                             customText(text: "Change Email", color: Colors.black, fontSize: 20),
                                             Spacer(),
                                             Icon(Icons.arrow_forward_sharp, color: Color(0xff1D592C), size: 35,)
                                           ],
                                         )
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),)

                       ],
                     ),
                   ),
                 ),

            ],
          );
        },
        fallback: (context){
          return Container(
            child: Center(child: CircularProgressIndicator()),
            height: 400,
          );
        }, condition: state is ! StateGetCurrentUserLoading,
      );

    }, listener: (context , state){

    });
  }
}
