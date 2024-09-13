import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CalculateScore extends GetxController {
  Future<void> calculateScore(String quizId, List<String> userAnswers) async {

   final List score=[];
    final url = Uri.parse('http://192.168.1.13:5000/calculate-score');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'quiz_id': quizId,
          'user_answers': userAnswers,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        score.add(responseData);
        // Do something with the total score
      } else {
        throw Exception('Failed to calculate score: ${response.reasonPhrase}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      // Handle error
    }
  }
}
