import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:learnfast/controllers/login.dart';

class FavouriteController extends GetxController{
  LoginController loginController=Get.put(LoginController());

  Future<String?> getCurrentUser(String userId) async {
    return loginController.getuserid(userId);
  }

  Future<String?> getCurrentToken() async {
    return loginController.gettoken();
  }

  Future<String?> getCurrentRole(String role) async {
    return loginController.getuserrole(role);
  }

  Future<void> addtofavourite(String courseID )async {
  final String? token = await getCurrentToken();
  final String? userId = await getCurrentUser(token!);
 Map<String, String> headers = {'Content-Type': 'application/json','Authorization':'Bearer $token'};
  
    Map<String, String> body = {"student_id": userId!, "course_id": courseID};
   
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/add-to-favorites'),
        headers: headers,
        body: jsonEncode(body),
      );
      
if(response.statusCode!=200){
  Get.snackbar('An error Occured !', "Sorry you can't add this course to favourites !");
}else{
  Get.snackbar('Enrolled ! ', "Congrats ! you've been enrolled to this course !");
}
  // ignore: empty_catches
  }catch(e){
  Get.snackbar('An error Occured !', "Sorry you can't enroll to this course !");
  }
}
}