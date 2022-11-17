import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/src/default_views/ChatView.dart';
import 'package:first_project/src/default_views/ChatViewWeb.dart';
import 'package:first_project/src/login_views/HomeView.dart';
import 'package:first_project/src/login_views/LoginView.dart';
import 'package:first_project/src/login_views/OnBoardingView.dart';
import 'package:first_project/src/login_views/RegisterView.dart';
import 'package:first_project/src/login_views/Splash.dart';
import 'package:first_project/src/singleton/DataHolder.dart';
import 'package:flutter/material.dart';

class App2 extends StatelessWidget {
  App2({Key? key}) : super(key: key);
  FirebaseFirestore db= FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    MaterialApp materialappmobile = const MaterialApp();
    // TODO: implement createState

   if (DataHolder().platformAdmin.isIosPlatform() ||
        DataHolder().platformAdmin.isAndroidPlatform()) {
      materialappmobile = MaterialApp(
        initialRoute: "/splash",
        routes: {
          "/loginView": (context) => LoginView(),
          "/registerview": (context) => RegisterView(),
          "/casaview": (context) => HomeView(),
          "/onboarding": (context) => OnBoardingView(),
          "/chatview": (context) => ChatView(),
          "/splash": (context) => SplashView(),
        },
      );
    }
    else if (DataHolder().platformAdmin.isWebPlatform()) {
      materialappmobile = MaterialApp(
        initialRoute: "/splash",
        routes: {
          "/loginView": (context) => LoginView(),
          "/registerview": (context) => RegisterView(),
          "/casaview": (context) => HomeView(),
          "/onboarding": (context) => OnBoardingView(),
          "/chatview": (context) => ChatView(),
          "/splash": (context) => SplashView(),
        },
      );
   }
    return materialappmobile;


     /* return MaterialApp(
        initialRoute:"/splash",
        routes:{
          "/loginView":(context) => LoginView(),
          "/registerview":(context) => RegisterView(),
          "/casaview": (context) => HomeView(),
          "/onboarding":(context) => OnBoardingView(),
          "/chatview":(context)=> ChatView(),
          "/splash":(context)=> SplashView(),
        },
      );
*/

  }
}
