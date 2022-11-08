import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {

  final String titulo;
  final Function(int index) onGoClick;
  final int iIndex;

const RoomItem({Key? key , required this.titulo, required this.onGoClick, required this.iIndex,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(titulo, textScaleFactor: 1.1,),
      leading: Icon(Icons.person),
      onTap: (){
        onGoClick(iIndex);
      },
    );



  }


}