import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/objetcts/Perfil.dart';
import 'package:flutter/material.dart';

import '../firebase/fbAdmin.dart';
import '../objetcts/Room.dart';
import '../platform/PlatformAdmin.dart';

class DataHolder{

  static final DataHolder _dataHolder= new DataHolder._internal();

  String sMensaje= "";
  Perfil perfil= Perfil();
  Room typeRoom= Room();
  FBAdmin fbAdmin = FBAdmin();

  double dScreenWidth=0;
  double dScreenHeigth=0;
  late PlatformAdmin platformAdmin;


  DataHolder._internal(){
    sMensaje="";
    platformAdmin=PlatformAdmin();
  }

  //void initPlatformDisplaySettings(BuildContext context){
  //  platformAdmin.initDisplayData(context);
 // }

  factory DataHolder(){
    return _dataHolder;
  }

  Future<void> descargarMIPerfil() async{
    perfil=await fbAdmin.descargarPerfil(FirebaseAuth.instance.currentUser?.uid) as Perfil;
  }

  Future<void> descargarPerfilGenerico(String? idPerfil) async{
    await fbAdmin.descargarPerfil(idPerfil) as Perfil;
  }

  bool isMIPerfilDownloaded(){
    return perfil!=null;
  }

}