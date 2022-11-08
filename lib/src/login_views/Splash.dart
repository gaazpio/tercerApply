import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../objetcts/Perfil.dart';
import '../singleton/DataHolder.dart';


class SplashView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLogged();
  }


  void isUserLogged() async{
    await Future.delayed(Duration(seconds:3));

    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/loginView");
    }
    else{
      await DataHolder().descargarMIPerfil();
      if(DataHolder().isMIPerfilDownloaded()==true){
        Navigator.of(context).popAndPushNamed("/casaview");
      }
      else{
        Navigator.of(context).popAndPushNamed("/onboarding");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //isUserLogged(context);
    return Scaffold(
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/walpaper.jpg"),
                fit: BoxFit.fill,
              )
          ),
        )
    );
  }

}