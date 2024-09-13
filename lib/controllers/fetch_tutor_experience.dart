import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class FetchTutorExperience extends GetxController{
Future<Map<String, dynamic>> fetchTutorExperience(String tutorId) async {
  
  const  String apiUrl = 'http://192.168.1.13:5000/checkexperience';

  try {
 
    final response = await http.get(Uri.parse('$apiUrl?tutor_id=$tutorId'));

   
    if (response.statusCode == 200) {
     
      return json.decode(response.body);
    } else {
      
      throw Exception('Failed to load tutor experience');
    }
  } catch (e) {

    throw Exception('Error: $e');
  }
}


}