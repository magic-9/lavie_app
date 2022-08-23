import 'package:flutter/material.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie_app/Shard/widgets/Widgets.dart';

import '../Cubit/StatesApp.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp,StatesApp>(builder: (context ,state){
      return  Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color : Color.fromRGBO(12, 12, 12, 0.8700000047683716),
                image: DecorationImage(
                    image: AssetImage("assets/images/Rectangle1022.png"),
                    fit: BoxFit.cover,
                    opacity: 0.2
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Ellipse105.png"),
                SizedBox(
                  height: 10,
                ),
                customText(text: "Mayar Mohamed", color: Colors.white, fontSize: 30)
              ],
            ),
          ),
          Expanded(child: Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            )
          ),child: Text("click")))

        ],
      );
    }, listener: (context , state){

    });
  }
}
