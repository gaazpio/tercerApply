import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/default_views/ChatView.dart';
import 'package:first_project/src/login_views/HomeView.dart';
import 'package:first_project/src/login_views/LoginView.dart';
import 'package:first_project/src/login_views/OnBoardingView.dart';
import 'package:first_project/src/login_views/RegisterView.dart';
import 'package:first_project/src/login_views/Splash.dart';
import 'package:first_project/src/singleton/DataHolder.dart';
import 'package:flutter/material.dart';

class App2 extends StatelessWidget {
  App2({Key? key}) : super(key: key);

  String getInitalRoute() {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/loginView';
    }
    else {
      return "/casaview";
    }
  }


  @override
  Widget build(BuildContext context) {
    MaterialApp materialappmobile = const MaterialApp();
    DataHolder().initPlatform(context);
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
  }
}
