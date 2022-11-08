import 'package:first_project/src/custom_views/RFInputText.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/custom_views/button.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  void loginbtn (
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password );
      Navigator.of(context).popAndPushNamed("/casaview");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong password') {
        print('Wrong password provided for that user.');
      }
    }
  }




  @override
  Widget build(BuildContextcontext) {
    RFInputText1 iUser = RFInputText1(sTitulo: "Usuario");
    RFInputText1 iContra = RFInputText1(sTitulo: "Contraseña", isPass: true);

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
          height: 420,
          width: 350,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 36),
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
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
                  'Login',
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
                padding: EdgeInsets.fromLTRB(10, 0, 20, 25),
                child: Text(
                  'Welcome to your account',
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
                padding: EdgeInsets.fromLTRB(5, 0, 0, 30),
                child: iContra,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      print("LOGEADO CON EXITO  " +
                          iUser.getText() +
                          " " +
                          iContra.getText());
                      loginbtn(iUser.getText(), iContra.getText(),
                          BuildContextcontext);
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                    child: Text
                      ("Sign In",style:TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),)
                    ),
                  ),
                  btn1()
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