
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/src/custom_views/RFInputext2.dart';
import 'package:first_project/src/objetcts/Perfil.dart';
import 'package:first_project/src/singleton/DataHolder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/custom_views/button.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardingView();
  }
}

class _OnBoardingView extends State<OnBoardingView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    DataHolder().sMensaje="HOLA DESDE ONBOARDING";
    checkProfile();

  }


  void checkProfile() async {

    final docRef = db.collection("perfiles").doc((FirebaseAuth.instance.currentUser?.uid));
        DocumentSnapshot docsnap=  await docRef.get();
        if(docsnap.exists){

          Navigator.of(context).popAndPushNamed("/loginView");
        }

  }

  void registerBTN(String nombre, String pais, String ciudad, int edad,
      BuildContext context) async {
    Perfil perfil =
        Perfil(name: nombre, city: ciudad, country: pais, edad: edad);

    /* final datosperfil = <String, dynamic>{
      "name": nombre,
      "city": ciudad,
      "country": pais,
      "edad": edad,
    };
*/
    await db
        .collection("perfiles")
        .doc((FirebaseAuth.instance.currentUser?.uid))
        .set(perfil.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/casaview");
  }

  @override
  Widget build(BuildContextcontext) {
    RFInputText2 iUser = RFInputText2(sTitulo: "Usuario");

    RFInputText2 pais = RFInputText2(sTitulo: "Pais");

    RFInputText2 ciudad = RFInputText2(sTitulo: "Ciudad");

    RFInputText2 edad = RFInputText2(sTitulo: "Edad");

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        title: Text(''),
        backgroundColor: Color.fromRGBO(135, 10, 1, 20),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(112, 0, 0, 20),
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 0,
                ),
                onPressed: () {}),
            Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          width: 350,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(135, 10, 1, 20),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 5),
                //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
                child: Text(
                  'OnBoarding',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(240, 240, 240, 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 20),
                child: Text(
                  'Welcome to new account',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(240, 240, 240, 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: iUser,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: ciudad,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: pais,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: edad,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      registerBTN(
                          iUser.getText(),
                          pais.getText(),
                          ciudad.getText(),
                          int.parse(edad.getText()),
                          BuildContextcontext);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                    child: Text(
                      "Join",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(135, 10, 1, 20),
                      ),
                    ),
                  ),
                  btn3()
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(210, 210, 210, 20),
    );
  }
}
