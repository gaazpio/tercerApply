import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/src/objetcts/Room.dart';
import 'package:first_project/src/singleton/DataHolder.dart';
import 'package:flutter/material.dart';


import '../list_items/RoomItem.dart';
import '../objetcts/Perfil.dart';

class AdministrarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  _AdministrarViewState();
  }
}

class _AdministrarViewState extends State<AdministrarView> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String nom = "--";
  bool isBtnVisible = true;
  List<Room> chatRooms = [];

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(
          title: Text('Pagina de administracion'),
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromRGBO(112, 0, 0, 20),
        ),

        body: Container(child: Container(
          height: 600,
          width: 3000,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 36),
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                  'Menu de administracion',
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
                padding: EdgeInsets.fromLTRB(10, 40, 20, 25),

                child:OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/registerview");
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                  child: Text
                    ("Registrarte con nueva cuenta",style:TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 25),

                child:OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/loginView");
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                  child: Text
                    ("Logearte con otra cuenta",style:TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),)
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 20, 25),

                child:OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/casaview");
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(210, 210, 210, 20)),
                  child: Text
                    ("Volver a los chats",style:TextStyle(fontSize: 14,color: Color.fromRGBO(135, 10, 1, 20),)
                  ),
                ),
              ),

            ],
          ),
        ),
        )
    );
  }
}
