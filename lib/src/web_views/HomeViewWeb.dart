import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/src/objetcts/Room.dart';
import 'package:first_project/src/singleton/DataHolder.dart';
import 'package:flutter/material.dart';


import '../list_items/RoomItem.dart';
import '../objetcts/Perfil.dart';

class HomeViewWeb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewWebState();
  }
}

class _HomeViewWebState extends State<HomeViewWeb> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String nom = "--";
  bool isBtnVisible = true;
  List<Room> chatRooms = [];

  @override
  void initState(){
    super.initState();
    actualizarList();
  }

  void actualizarNom() async {
    // String? idUser = FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("perfiles").doc((FirebaseAuth.instance.currentUser?.uid))
        .withConverter(
        fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();
    //final perfilUsuario = docSnap.data(); // Convert to City object
    DataHolder().perfil=docSnap.data()!;
    if (  DataHolder().perfil != null) {
      print(  DataHolder().perfil.edad);

      setState(() {
        nom = (  DataHolder().perfil.name)!;
      });
    } else {
      print("No such document.");
    }
  }

  void actualizarList() async{
    final docRef = db.collection("rooms")
        .withConverter(fromFirestore:Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    final docSnap= await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        chatRooms.add(docSnap.docs[i].data());
      }

    });
  }

  void onClickView(int index){
    print(index.toString());
    print(chatRooms[index].name!);
    DataHolder().typeRoom=chatRooms[index];
    Navigator.of(context).pushNamed("/chatview");

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(
          title: Text('Chats'),
          automaticallyImplyLeading: false,
          backgroundColor:Color.fromRGBO(112, 0, 0, 20),
          actions: <Widget> [
            Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child:  IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed("/administrar");
                    // do something
                  },
                )),
          ],
        ),

        body: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: chatRooms.length,
            itemBuilder: (BuildContext context, int index) {
              return RoomItem(titulo:chatRooms[index].name!, onGoClick:onClickView, iIndex: index,);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        )
    );
  }
}
