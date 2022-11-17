import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PlatformAdmin{
     // int iEsAndroid=0;
      // int iEsIos=1;
     // int iEsWeb=2;

      double dScreenWidth=0;
      double dScreenHeigth=0;
      BuildContext? context;

      PlatformAdmin();


      void initDisplayData(BuildContext context){
            this.context;
            dScreenWidth=MediaQuery.of(context).size.width;
            dScreenHeigth=MediaQuery.of(context).size.height;
      }

      bool isAndroidPlatform(){
            return defaultTargetPlatform== TargetPlatform.android;
      }

      bool isIosPlatform(){
            return defaultTargetPlatform== TargetPlatform.iOS;
      }
      bool isWebPlatform(){
            return defaultTargetPlatform != TargetPlatform.iOS
                && defaultTargetPlatform != TargetPlatform.android;
      }




}