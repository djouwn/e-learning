import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/login.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/views/profiletutor/add_first_quizz.dart';
class AddVideosController extends GetxController{
  
   LoginController loginController=Get.put(LoginController());
  
  Future<String?> getcurrrentuser(userid) async {
    return  loginController.getuserid(userid);
   
  }
  Future<String?> getcurrenttoken(token) async{
    return loginController.gettoken();
  }
   Future<String?> getCurrentToken() async {
     return loginController.gettoken();
   }
Future<void> addvideos(String videoname,String courseid,String videopath) async {
  String? token = await getCurrentToken();
  if (kDebugMode) {
    print(token);
  }

  String? userId = await loginController.getuserid(token!);
 Map<String, String> headers = {'Content-Type': 'application/json','Authorization':'Bearer $token'};
  
    Map<String, String> body = {"tutor_id": userId!, "video_name": videoname,"course_id":courseid,"video_path":videopath};

     try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/add-videos'),
        headers: headers,
        body: jsonEncode(body),
      );
      
if(response.statusCode!=200){
  Get.snackbar('An error Occured !', "Sorry you can't enroll to this course !");
}else{
  Get.snackbar('Enrolled ! ', "Congrats ! you've been enrolled to this course !");
  Get.to(AddYourFirstQuizz(courseId: courseid));
}
  // ignore: empty_catches
  }catch(e){
  Get.snackbar('An error Occured !', "Sorry you can't enroll to this course !");
  }

}
}
