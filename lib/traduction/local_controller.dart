import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController{
  void changeLang(String codeLang){
    Locale currentlangauge=Locale(codeLang);
    Get.updateLocale(currentlangauge);
  }
}