import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../objetcts/Perfil.dart';
import '../singleton/DataHolder.dart';


class SplashView extends StatefulWidget{
  final String sLogoPath;
  const SplashView(this.sLogoPath, {super.key});



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
      bool existe=await checkExistingProfile();
      if(existe){
        setState(() {
          Navigator.of(context).popAndPushNamed("/casaview");
        });
      }
      else{
        Navigator.of(context).popAndPushNamed("/onboarding");
      }
    }
  }


  Future<bool> checkExistingProfile() async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    return docsnap.exists;
  }

  @override
  Widget build(BuildContext context) {
    DataHolder().platformAdmin.initDisplayData(context);
    print("TIENE UN ALTO DE "+DataHolder().platformAdmin.dScreenHeigth.toString());
    print("TIENE UN ANCHO DE "+DataHolder().platformAdmin.dScreenWidth.toString());

    // TODO: implement build
    //isUserLogged(context);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:[
              Image(image: AssetImage(widget.sLogoPath),
                width:DataHolder().platformAdmin.dScreenWidth/1.2,),
             Padding(padding:  EdgeInsets.fromLTRB(10, 55, 0, 10),
               child:Text("CARGANDO...",style: TextStyle(fontSize: DataHolder().platformAdmin.dScreenWidth/20,color: Colors.black54))),
          ]
        ),
    ),
    );
  }

}