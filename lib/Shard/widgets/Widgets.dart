
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget customButton({required Color color ,required Widget textWidget , VoidCallback? onPressed}){
  return ElevatedButton( onPressed: onPressed,style: ElevatedButton.styleFrom(
  primary: color
  ), child: textWidget);
}

Widget customText({required String text,required Color? color,required double? fontSize}){
  return Text(text , style: TextStyle(
      color: color,
    fontSize: fontSize
  ));
}

Future<bool?> customToast({required String message ,required Color color}){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}