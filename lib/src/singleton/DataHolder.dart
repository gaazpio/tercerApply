import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/src/objetcts/Perfil.dart';

import '../firebase/fbAdmin.dart';
import '../objetcts/Room.dart';

class DataHolder{

  static final DataHolder _dataHolder= new DataHolder._internal();

  String sMensaje= "";
  Perfil perfil= Perfil();
  Room typeRoom= Room();
  FBAdmin fbAdmin = FBAdmin();

  DataHolder._internal(){
    sMensaje="";

  }

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