import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class YourController extends GetxController {
  RxBool isSelected = false.obs;
  List<String> options = <String>[];
  RxList<int> selectedIndexes = <int>[].obs;
  Rx<int> selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    fetchSpecialite();
    fetchInstitution();
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void toggleIndex(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else if (selectedIndexes.length < 7) {
      selectedIndexes.add(index);
    }
  }

  void toggle() {
    isSelected.value = !isSelected.value;
  }

  Color getColor() {
    return isSelected.value ? Colors.red : Colors.white;
  }

  Future<void> fetchSpecialite({int page = 1, int pageSize = 10}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String url = 'http://192.168.1.13:5000/specialized_in?page=$page&pageSize=$pageSize';

    if (prefs.containsKey('specialite')) {
      final cachedData = prefs.getStringList('specialite');
      options.assignAll(cachedData!);
      if (kDebugMode) {
        print('Data retrieved from cache: $cachedData');
      }
    } else {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<String> data = json.decode(response.body)['specialite'].cast<String>();
        options.assignAll(data);
        prefs.setStringList('specialite', data);
        if (kDebugMode) {
          print('Data fetched from server and cached: $data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  Future<void> fetchInstitution({int page = 1, int pageSize = 10}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String url = 'http://192.168.1.13:5000/institution?page=$page&pageSize=$pageSize';

    if (prefs.containsKey('institutions')) {
      final cachedData = prefs.getStringList('institutions');
      options.assignAll(cachedData!);
      if (kDebugMode) {
        print('Data retrieved from cache: $cachedData');
      }
    } else {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<String> data = json.decode(response.body)['institutions'].cast<String>();
        options.assignAll(data);
        prefs.setStringList('institutions', data);
        if (kDebugMode) {
          print('Data fetched from server and cached: $data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

 
}
