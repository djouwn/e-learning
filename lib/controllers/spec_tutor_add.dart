import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SpecialiteTutorController extends GetxController {
  final String apiUrl = 'http://192.168.1.13:5000'; 

  Future<void> addSpecialiteTutor(String specialiteNom, int tutorId) async {
    const String addSpecialiteTutorEndpoint = '/add_specialite_tutor';
    final String addSpecialiteTutorUrl = '$apiUrl$addSpecialiteTutorEndpoint';

    try {
      final response = await http.post(
        Uri.parse(addSpecialiteTutorUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'specialite_nom': specialiteNom,
          'tutor_id': tutorId,
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Values inserted into specialite_tutor successfully');
        }
      } else {
        if (kDebugMode) {
          print('Failed to add specialite_tutor: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void addPreferences(List<String> options) {}
}
