import 'package:first_project/src/custom_views/RFInputext2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/custom_views/button.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  void registerBTN(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(context).popAndPushNamed("/onboarding");
    } on FirebaseAuthException catch (e) {
      print("ERROR DE CREACION DE USUARIO " + e.code);
      if (e.code == 'weak-password') {
        print('Esa contraseña es muy debil, prueba con otra');
      } else if (e.code == 'email-already-in-use') {
        print('Este gmail ya esta registrado');
      }
    } catch (e) {
      print(e);
    }
    print("USUARIO CREADO CORRECTAMENTE");
  }

  @override
  Widget build(BuildContextcontext) {
    RFInputText2 iUser = RFInputText2( sTitulo: "Usuario");

    RFInputText2 iContra = RFInputText2(
        sTitulo: "Contraseña", isPass: true);

    RFInputText2 iRepeatContra = RFInputText2(
         sTitulo: "Misma contraseña", isPass: true);

    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.menu),
          title: Text(''),
          backgroundColor:Color.fromRGBO(135, 10, 1,20),
        ),

        bottomNavigationBar: BottomAppBar(
          color:Color.fromRGBO(112, 0, 0,20),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu,size: 0,), onPressed: () {}),
              Spacer(),
            ],
          ),
        ),



        body:
        SingleChildScrollView(
        child:
        Container(
          height: 500,
          width: 350,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical:40),
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
                  'Registro',
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
                child: iContra,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: iRepeatContra,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (iContra.getText() == iRepeatContra.getText()) {
                        registerBTN(iUser.getText(), iContra.getText(),
                            BuildContextcontext);
                        print(iUser.getText() + " " + iContra.getText());
                      } else {
                        print("Las contraseñas no coinciden");

                      }
                    },
                   style: TextButton.styleFrom(backgroundColor: Color.fromRGBO(210, 210, 210,20)),
                    child: Text("Registrarse",
                    style: TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),),),

                  ),
                  btn3()
                ],
              ),
            ],
          ),
        ),
        ),
      backgroundColor:Color.fromRGBO(210, 210, 210,20),
    );


  }
}
