import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class JoinInstitutController extends GetxController{
Future<void> joinInstitution(String tutorId, String institutionId) async {
  const baseUrl = 'http://192.168.1.13:5000';
  final url = Uri.parse('$baseUrl/join-institut');
  
  final data = {
    "tutor_id": tutorId,
    "institution_id": institutionId
  };

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Joined institution successfully');
    }
  } else {
    if (kDebugMode) {
      print('Failed to join institution: ${response.reasonPhrase}');
    }
  }
}

Future<void> acceptRequest(String proposalId) async {
  const baseUrl = 'http://192.1681.13:5000';
  final url = Uri.parse('$baseUrl/accept-request');
  
  final data = {
    "proposal_id": proposalId,
  };

  final response = await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Request accepted successfully');
    }
  } else {
    if (kDebugMode) {
      print('Failed to accept request: ${response.reasonPhrase}');
    }
  }
}

Future<void> denyRequest(String proposalId) async {
  const baseUrl = 'http://localhost:5000';
  final url = Uri.parse('$baseUrl/deny-request');
  
  final data = {
    "proposal_id": proposalId,
  };

  final response = await http.delete(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Request denied successfully');
    }
  } else {
    if (kDebugMode) {
      print('Failed to deny request: ${response.reasonPhrase}');
    }
  }
}
}