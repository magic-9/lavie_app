import 'package:flutter/material.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:lavie_app/Cubit/StatesApp.dart';
import 'package:lavie_app/Shard/widgets/Widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,StatesApp>(
       builder: (context ,state){

         int? countNotification = CubitApp.get(context).currentUser?.data?.userNotification.length;
         return  SingleChildScrollView(
           child: Container(
             color: Colors.white,
             width: MediaQuery.of(context).size.width,
             height:  MediaQuery.of(context).size.height,
             child: ListView.separated(itemBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.symmetric(
                     vertical: 10
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             child: CachedNetworkImage(
                               imageUrl:  "https://lavie.orangedigitalcenteregypt.com${CubitApp.get(context).currentUser?.data?.userNotification[index].imageUrl}",
                               fit:BoxFit.cover,
                               placeholder: (context, url) => Container(

                                 child: Center(child: CircularProgressIndicator()),
                               ),
                               errorWidget: (context, url, error) => Icon(Icons.error),
                             ),
                             width: 100,
                           ),

                           SizedBox(
                             width: 10,
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 width: MediaQuery.of(context).size.width - 140,
                                 child: Text("${CubitApp.get(context).currentUser?.data?.userNotification[index].message}",style: TextStyle(
                                   color: Color(0xff1A1F36), fontSize: 16,
                                 ), maxLines: 3,),
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               customText(text: "${CubitApp.get(context).currentUser?.data?.userNotification[index].createdAt}", color: Color(0xffA5ACBB), fontSize: 14)
                             ],
                           )
                         ],
                       )
                     ],
                   ),
                 ),
               );
             }, separatorBuilder: (context,index){
               return  Divider();
             }, itemCount: countNotification!),
           ),
         );
       },
      listener:(context ,state){

      }
    );
  }
}
