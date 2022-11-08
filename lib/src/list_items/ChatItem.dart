import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {

  final String sTexto;
  final Function(int index) onGoClick;
  final int iIndex;

  const ChatItem ({Key? key , this.sTexto="mensaje", required this.onGoClick, required this.iIndex}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(children: <Widget>[

        Row(children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(0, 5.0, 0, 0),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            child: Text(
              sTexto,
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
            color: Color.fromRGBO(135, 10, 1, 20),
            borderRadius: BorderRadius.circular(10.0),
          ),
          ),

        ],mainAxisAlignment: MainAxisAlignment.end
        ),
      ],),
    );


  }


}