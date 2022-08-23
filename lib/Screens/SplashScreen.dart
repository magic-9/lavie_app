import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lavie_app/Screens/MainScreen.dart';
import 'package:lavie_app/Screens/LoginScreen.dart';
import 'package:lavie_app/Shard/local/CacheHelper.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen() : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextScreen: CacheHelper.getData(key: 'token') != null ? MainScreen() : LoginScreen(),
        duration: 3000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset("assets/images/logo.png" ),)
          ],
        ),
        splashIconSize: 450,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
