import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  MaterialColor primaryColor = Colors.amber;
  List selectedIndex = [];
  var selected = 'first'.obs;
  int? index;
  var childList = <String>[].obs;
  var isHighlighted = false.obs;
  var backgroundColor = Colors.white.obs; // Added background color observable

  bool containerselected() {
    if (selectedIndex.contains(index)) {
      selectedIndex.remove(index);
      return true;
    } else {
      selectedIndex.add(index);
      return false;
    }
  }

  void addChild(String child) {
    childList.add(child);
    if (kDebugMode) {
      print(childList);
    }
  }

  void changeBackgroundColor(Color newColor) {
    backgroundColor.value = newColor;
  }
}
