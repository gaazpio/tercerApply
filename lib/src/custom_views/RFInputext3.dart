import 'package:flutter/material.dart';


class RFInputText3 extends StatelessWidget{

  final String sTitulo;
  final TextEditingController myController = TextEditingController(text: "");
  final String helpText;
  final String valorIni =" ";
  final bool isPass;


  RFInputText3 ({Key? key, required this.sTitulo, this.helpText="", this.isPass=false}) : super(key:key);

  String getText() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,

      child: TextFormField(
        minLines: 1,
        maxLines: 5,
        controller: myController,
        cursorColor: Color.fromRGBO(112, 0, 0, 20),
        obscureText:isPass,
        enableSuggestions: isPass,
        autocorrect: isPass,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.emoji_emotions_outlined, color:Colors.white54),
          filled: true,
          fillColor:Color.fromRGBO(112, 0, 0, 20),
          labelText: sTitulo,
          labelStyle: TextStyle(
              color:Colors.white54,
              fontSize: 15,
          ),
          helperText: this.helpText,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),borderSide: BorderSide.none),
        ),

      ),
    );

  }

}
