import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/login.dart';

class ShowFavouriteController extends GetxController {
  RxList<dynamic> favoriteCourses = [].obs;
LoginController loginController=Get.put(LoginController());
  Future<void> fetchFavoriteCourses({ int page = 1, int perPage = 10}) async {
   String ? token= await loginController.gettoken();
   String ? userId= await loginController.getuserid(token!);
   
    try {
      String url = 'http://192.168.1.13:5000/favorite-courses?page=$page&per_page=$perPage';
      if (userId != null) url += '&user_id=$userId';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        favoriteCourses.value = responseData['favorite_courses'];
      } else if (response.statusCode == 404) {
     
        favoriteCourses.clear();
      } else {
       
        favoriteCourses.clear();
        throw Exception('Failed to fetch favorite courses: ${response.reasonPhrase}');
      }
    } catch (e) {
 
      favoriteCourses.clear();
      if (kDebugMode) {
        print('Error fetching favorite courses: $e');
      }
    }
  }
}
