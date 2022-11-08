import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/default_views/ChatView.dart';
import 'package:first_project/src/login_views/HomeView.dart';
import 'package:first_project/src/login_views/LoginView.dart';
import 'package:first_project/src/login_views/OnBoardingView.dart';
import 'package:first_project/src/login_views/RegisterView.dart';
import 'package:first_project/src/login_views/Splash.dart';
import 'package:flutter/material.dart';

class App2 extends StatelessWidget{
  App2 ({Key? key}): super(key: key);

  String getInitalRoute(){
    if(FirebaseAuth.instance.currentUser==null){
      return '/loginView';
    }
    else{
      return "/casaview";
    }
  }



  @override
  Widget build (BuildContext context) {
    // TODO: implement createState
    return MaterialApp(
      initialRoute:"/loginView",
      routes:{
        "/loginView":(context) => LoginView(),
        "/registerview":(context) => RegisterView(),
        "/casaview": (context) => HomeView(),
        "/onboarding":(context) => OnBoardingView(),
        "/chatview":(context)=> ChatView(),
        "/splash":(context)=> SplashView(),
      },
    );
  }


}
