import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AcceptProposal extends GetxController {
  Future<void> acceptProposal(String tutorEmail, String jwtToken) async {
    const baseUrl = 'http://192.168.1.13:5000'; 
    final url = Uri.parse('$baseUrl/accept-proposal');
    
    final data = {
      "tutor_email": tutorEmail,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $jwtToken', 
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Proposal accepted successfully');
      }
    } else {
      if (kDebugMode) {
        print('Failed to accept proposal: ${response.reasonPhrase}');
      }
    }
  }
}
