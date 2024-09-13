import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InstitutionController extends GetxController {
  RxList institutions = [].obs; // observable list

  void fetchInstitutions() async {
    try {
      var response = await http.get(Uri.parse('http://192.168.1.13:5000/list_institutions'));
      if (response.statusCode == 200) {
        institutions.add(response.body); // update institutions list
        print(institutions[0]);
      } else {
        if (kDebugMode) {
          print('Failed to load institutions');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
