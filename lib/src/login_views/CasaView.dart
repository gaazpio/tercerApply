import 'package:flutter/material.dart';
import 'package:first_project/src/custom_views/button.dart';


class CasaView extends StatelessWidget {
  CasaView({Key? key}): super(key: key);

  @override
  Widget build(BuildContextcontext) {


    return Scaffold(

      body:
      SingleChildScrollView(
      child:
      Container(
      height: 200,
      width: 350,
      padding: EdgeInsets.symmetric(horizontal: 25,vertical:36),
      margin: new EdgeInsets.symmetric(horizontal: 20.0,vertical: 320.0),
      decoration: BoxDecoration(
        color:Color.fromRGBO(135, 10, 1,20),
        borderRadius: BorderRadius.circular(15.0),
      ),

      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 20), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
      child: Text(
      "Enhorabuena te has logeado correctamente",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold,
          color:Color.fromRGBO(240, 240, 240,20),

        ),
      ),
    ),
         Row(

           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             btn4()
           ]
         ) ],


      )
      ),
    ),
      backgroundColor:Color.fromRGBO(210, 210, 210,20),

    );

  }



}