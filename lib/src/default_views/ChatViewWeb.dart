import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/custom_views/RFInputText.dart';
import 'package:first_project/src/list_items/ChatItem.dart';
import 'package:first_project/src/objetcts/FBText.dart';
import 'package:first_project/src/singleton/DataHolder.dart';
import 'package:flutter/material.dart';
import '../custom_views/RFInputext3.dart';

class ChatViewWeb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatViewWeb();
  }
}

class _ChatViewWeb extends State<ChatViewWeb> {
  @override
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<FBText> msgTexts = [];
  RFInputText3 iMsg = RFInputText3(
    sTitulo: "Mensaje",
  );
  String? idUser = FirebaseAuth.instance.currentUser?.uid;

  void initState() {
    // TODO: implement initState
    super.initState();
    print("DEBUG${DataHolder().typeRoom.name!}");
    descargarText();
  }

  void descargarText() async {
    String path = "rooms/${DataHolder().typeRoom.uid}/texts";
    final docRef = db.collection(path).withConverter(
        fromFirestore: FBText.fromFirestore,
        toFirestore: (FBText fbText, _) => fbText.toFirestore());

    final docSnap = await docRef.get();

    docRef.snapshots().listen(
          (event) => {
        setState(() {
          msgTexts.clear();
          for (int i = 0; i < event.docs.length; i++) {
            msgTexts.add(event.docs[i].data());
          }
        })
      },
      onError: (error) => print("Listen failed: $error"),
    );

    /*setState(() {
      for (int i = 0; i < docSnap.docs.length; i++) {
        msgTexts.add(docSnap.docs[i].data());
      }
    });
  }
*/
  }

  void enviarText() async {
    String path = "rooms/${DataHolder().typeRoom.uid}/texts";
    final docRef = db.collection(path);
    FBText texto =
    FBText(text: iMsg.getText(), author: idUser, time: Timestamp.now());

    await docRef.add(texto.toFirestore());
    // descargarText();
  }

  void onClickView(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.filter_none),
        title: Text(DataHolder().typeRoom.name!),
        backgroundColor: Color.fromRGBO(112, 0, 0, 20),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 685,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: msgTexts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatItem(
                      sTexto: msgTexts[index].text!,
                      onGoClick: onClickView,
                      iIndex: index,
                    );
                  },
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0), child:Row (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 7, 0, 0), child: iMsg),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(112, 0, 0, 20),
                          side: BorderSide(
                            width: 300.0,
                            color: Color.fromRGBO(112, 0, 0, 20),
                            style: BorderStyle.solid,
                          )),
                      label: Text(""),
                      icon: Icon(Icons.send,color:Colors.white54),
                      onPressed: enviarText,
                    ),
                  ),
                ],
              ),
              ),
            ],
          )),
    );
  }
}
