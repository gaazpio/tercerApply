import 'package:flutter/material.dart';


class RFInputText2 extends StatelessWidget{

  final String sTitulo;
  final TextEditingController myController = TextEditingController(text: "");
  final String helpText;
  final String valorIni =" ";
  final bool isPass;

  RFInputText2 ({Key? key, required this.sTitulo, this.helpText="", this.isPass=false}) : super(key:key);

  String getText() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: myController,
      maxLength: 20,
      obscureText:isPass,
      enableSuggestions: isPass,
      autocorrect: isPass,
      decoration: InputDecoration(
        labelText: sTitulo,
        labelStyle: TextStyle(
          color:Colors.white,
        ),
        helperText: this.helpText,
        suffixIcon: Icon(
          Icons.access_time,color: Color.fromRGBO(230, 230, 230,20),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.white),
        ),
      ),
    );

  }

}