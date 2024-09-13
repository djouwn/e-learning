import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/login.dart';

class UpdateTututorData extends GetxController{
  LoginController loginController=Get.put(LoginController());
  Future<void> updateUserexperience( bool hasExperience, bool comfortableIT) async {
 
 String ? token= await loginController.gettoken();
   String ? userId= await loginController.getuserid(token!);
  try {
      String url = 'http://192.168.1.13:5000/update_user';


    Map<String, dynamic> requestBody = {
      'user_id':userId,
      'has_experience': hasExperience,
      'comfortable_IT': comfortableIT,
    };

  
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
     
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (kDebugMode) {
        print(responseData['message']);
      }
    } else {
     
      if (kDebugMode) {
        print('Failed to update user: ${response.body}');
      }
    }
  } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
  }
}

}