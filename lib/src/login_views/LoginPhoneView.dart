import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/custom_views/RFInputText.dart';
import 'package:flutter/material.dart';

import '../custom_views/button.dart';

class LoginPhoneView extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _LoginPhoneView();
  }
}


  class _LoginPhoneView extends State<LoginPhoneView>{

  RFInputText1 iTelefono = RFInputText1(sTitulo: "Numero de telefono");
  RFInputText1 iCodigo = RFInputText1(sTitulo: "Codigo");
  bool blwaitingSMS=false;
  late String verificationId;

  void enviarNum(String phoneNumber,BuildContext context) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("ME HE LOGEADO!");
        Navigator.of(context).popAndPushNamed('/casaview');
      },
      verificationFailed: (FirebaseAuthException e) {

      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId=verificationId;
        setState(() {
          blwaitingSMS=true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );

  }


  void enviarCodigo(String smsCode,BuildContext context) async{
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("ME HE LOGEADO!");
    Navigator.of(context).popAndPushNamed('/casaview');
  }

  /*late String verificationId;

  void enviarTelefono(String phoneNumber,BuildContext context) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("ME HE LOGEADO!");
        Navigator.of(context).popAndPushNamed('/home');
      },
      verificationFailed: (FirebaseAuthException e) {

      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId=verificationId;
        setState(() {
          blIsWaitingForSMS=true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );

  }
  }*/


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
                    fontSize: 28,
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
                child: iTelefono,
              ),
              if(blwaitingSMS)Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 30),
                child: iCodigo,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      enviarNum(iTelefono.getText(),context);
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                    child: Text
                      ("Enviar codigo",style:TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),)
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      enviarCodigo(iCodigo.getText(),context);
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                    child: Text
                      ("Logearse",style:TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),)
                    ),
                  ),
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
