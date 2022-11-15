import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformAdmin{

     // int iEsAndroid=0;
      // int iEsIos=1;
     // int iEsWeb=2;

      double dScreenWidth=0;
      double dScreenHeigth=0;
      late BuildContext context;


      PlatformAdmin(this.context);

      bool isAndroidPlatform(){
            return defaultTargetPlatform== TargetPlatform.android;
      }

      bool isIosPlatform(){
            return defaultTargetPlatform== TargetPlatform.iOS;
      }
      bool isWebPlatform(){
            return defaultTargetPlatform != TargetPlatform.windows
                && defaultTargetPlatform== TargetPlatform.android
                && defaultTargetPlatform== TargetPlatform.iOS
                && defaultTargetPlatform== TargetPlatform.fuchsia
                && defaultTargetPlatform== TargetPlatform.linux
                && defaultTargetPlatform== TargetPlatform.macOS;
      }




}