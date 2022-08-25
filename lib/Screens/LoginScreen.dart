import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lavie_app/Cubit/CubitApp.dart';
import 'package:lavie_app/Cubit/StatesApp.dart';
import 'package:lavie_app/Screens/MainScreen.dart';
import 'package:lavie_app/Shard/utils/AppColors.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import '../Shard/widgets/Widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var keySignUp = GlobalKey<FormState>();
  var keyLogin = GlobalKey<FormState>();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();


  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, StatesApp>(
      builder: (context, state){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(child: Image.asset("assets/images/bg.png" , height: 140), top: 0, right: 0),
              Positioned(
                child:  SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/logo.png", height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30
                                    ),
                                    child:
                                    Container(
                                      child: ContainedTabBarView(
                                        initialIndex: 1,
                                        tabs: [
                                          Text('Sign up'),
                                          Text('Login'),
                                        ],
                                        views: [
                                          Form(
                                              key: keySignUp,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  customText(
                                                      fontSize: 15,
                                                      color: AppColors.gray,
                                                      text: "First Name"
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: firstName,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0)
                                                    ),
                                                    validator: (val){
                                                      if(val!.isEmpty){
                                                        return "Please enter your first name";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  customText(
                                                      fontSize: 15,
                                                      color: AppColors.gray,
                                                      text: "Last Name"
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: lastName,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0)
                                                    ),
                                                    validator: (val){
                                                      if(val!.isEmpty){
                                                        return "Please enter your last name";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  customText(
                                                      fontSize: 15,
                                                      color: AppColors.gray,
                                                      text: "Email"
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: emailSignUp,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0)
                                                    ),
                                                    validator: (val){
                                                      if(val!.isEmpty){
                                                        return "Please enter your email";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  customText(
                                                      fontSize: 15,
                                                      color: AppColors.gray,
                                                      text: "Password"
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller: passwordSignUp,
                                                    obscureText: true,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors.gray
                                                          ),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0)
                                                    ),
                                                    validator: (val){
                                                      if(val!.isEmpty){
                                                        return "Please enter your password";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(width: MediaQuery.of(context).size.width,height: 50, child: customButton(
                                                      onPressed: (){
                                                        if(keySignUp.currentState!.validate()){
                                                          CubitApp.get(context).register(firstName: firstName.text, lastName: lastName.text, email: emailSignUp.text, password: passwordSignUp.text);
                                                        }
                                                      },
                                                      color: AppColors.primary,
                                                      textWidget: customText(
                                                        color: Colors.white,
                                                        fontSize: 19,
                                                        text: "Sign up",
                                                      )
                                                  )),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Positioned(
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          color: Color(0xff979797),
                                                          height: 1,
                                                          padding: EdgeInsets.all(5),
                                                        ),
                                                        top: 17,
                                                      ),
                                                      Align(alignment: Alignment.center,child: Container(padding: EdgeInsets.all(10), color: Colors.white,child: customText(
                                                          text: "or continue with" ,
                                                          fontSize: 13,
                                                          color: Color(0xff979797)
                                                      )))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      GestureDetector(
                                                        child: Image.asset("assets/images/Google.png"),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        child: Image.asset("assets/images/Facebook.png"),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                          Form(
                                              key: keyLogin,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Email" ,style: TextStyle(
                                                      color: AppColors.gray
                                                  )),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: emailLogin,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10)
                                                        )
                                                    ),

                                                    validator: (val){
                                                      if(val!.isEmpty){
                                                        return "Please enter your email";
                                                      }
                                                      return  null;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text("Password" ,style: TextStyle(
                                                      color: AppColors.gray
                                                  ),),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    obscureText: true,
                                                    controller: passwordLogin,
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColors.gray
                                                          ),
                                                          borderRadius: BorderRadius.circular(10),
                                                        )
                                                    ),
                                                    validator: (val){
                                                      if(val!.isEmpty){
                                                        return "Please enter your password";
                                                      }
                                                      return  null;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(width: MediaQuery.of(context).size.width, height: 60, child: customButton(
                                                      onPressed: (){
                                                        if(keyLogin.currentState!.validate()){
                                                          CubitApp.get(context).login(
                                                              email: emailLogin.text,
                                                              password: passwordLogin.text
                                                          );
                                                        }
                                                      },
                                                      color: AppColors.primary,
                                                      textWidget: customText(
                                                        color:Colors.white,
                                                        fontSize:  19,
                                                        text: "Login",
                                                      )
                                                  )),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Positioned(
                                                        child: Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          color: Color(0xff979797),
                                                          height: 1,
                                                          padding: EdgeInsets.all(5),
                                                        ),
                                                        top: 17,
                                                      ),
                                                      Align(alignment: Alignment.center,child: Container(padding: EdgeInsets.all(10), color: Colors.white,child: customText(
                                                          text: "or continue with" ,
                                                          color: Color(0xff979797) ,
                                                          fontSize: 13
                                                      ))),

                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [
                                                      GestureDetector(
                                                        child: Image.asset("assets/images/Google.png"),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      GestureDetector(
                                                        child: Image.asset("assets/images/Facebook.png"),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ))
                                        ],
                                        tabBarProperties: TabBarProperties(
                                            width: 500,
                                            height: 50,
                                            indicatorWeight:4,
                                            indicatorColor: AppColors.primary,
                                            labelColor: AppColors.primary,
                                            unselectedLabelColor: AppColors.gray,
                                            labelStyle: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                            indicatorSize: TabBarIndicatorSize.label
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ), top: 120,),
              Positioned(child: Image.asset("assets/images/bottom-left.png" , height: 120), bottom: 0, left: 0)
            ],
          ),
        );
      },
      listener: (context, state){
        if(state is StateRegisterError){
          customToast(
            color: Colors.red,
            message:  state.userError.message.toString().replaceFirst("[", "").replaceAll("]", ""),
          );

        }else if(state is StateRegisterSuccess){
          customToast(
            color: AppColors.primary,
            message:  state.user.message.toString(),
          );
          emailSignUp.clear();
          firstName.clear();
          lastName.clear();
          passwordLogin.clear();
        }else if(state is StateLoginError){
          customToast(
            color: Colors.red,
            message: state.userError.message.toString().replaceFirst("[", "").replaceAll("]", ""),
          );
        }else if(state is StateLoginSuccess){

          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  BlocProvider(
              create: (context) => CubitApp()..getForums("all")..getCurrentUser(),
              child: const MainScreen())
          ));
          customToast(
            color: AppColors.primary,
            message:  state.user.message!,
          );
        }
      },
    );
  }



}
