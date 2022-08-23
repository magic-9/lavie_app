import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:lavie_app/Screens/SplashScreen.dart';

import 'Cubit/StatesApp.dart';
import 'Shard/local/CacheHelper.dart';
import 'Shard/network/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  String token = CacheHelper.getData(key:"token") != null ? CacheHelper.getData(key:"token") : "";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CubitApp()..getForums('all'))
      ],
      child: BlocConsumer<CubitApp,StatesApp>(
        builder: (context , state){
          return MaterialApp(
            title: 'La Vie',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.grey,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
            ),
            home: const SplashScreen(),
          );
        },
        listener: (context, state){

        },
      ),
    );
  }
}
