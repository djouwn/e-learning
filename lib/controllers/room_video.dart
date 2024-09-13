import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RoomController extends GetxController {
  final String apiUrl = 'http://129.1681.13:5000'; 

  Future<void> insertRoomsIntoMongoDB(List<List<dynamic>> rooms) async {
    const String insertRoomsEndpoint = '/insert_rooms';
    final String insertRoomsUrl = '$apiUrl$insertRoomsEndpoint';

    try {
      for (var room in rooms) {
        final response = await http.post(
          Uri.parse(insertRoomsUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'tutor_id': room[0],
            'institution_id': room[1],
          }),
        );
        if (response.statusCode == 200) {
          if (kDebugMode) {
            print('Room inserted into MongoDB successfully.');
          }
        } else {
          if (kDebugMode) {
            if (kDebugMode) {
          }
            print('Failed to insert room into MongoDB: ${response.statusCode}');
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting rooms into MongoDB: $e');
      }
    }
  }
}
