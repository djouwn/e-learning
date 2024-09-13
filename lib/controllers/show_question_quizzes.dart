import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/courses_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowQuizOptionsAndQuestionsAndScore extends GetxController {
  int currentPage = 1;
  bool isLoading = false;
  final String baseUrl = 'http://192.168.1.13:5000';
  final String optionsCacheKey = 'quiz_optionsjhjhgyygiygghgh';
  final String questionsCacheKey = 'quiz_questjfygyuiighghgions';
  final List<dynamic> options = [].obs; 
  final List<dynamic> questions = [].obs; 
  final ScrollController scrollController = ScrollController();
  String ?questionId;
    String ?courseId;
    CoursesController   coursesController=Get.put(CoursesController());
  @override
  void onInit() {
    super.onInit();

    getOptionsFromCache();
    getQuestionsFromCache();
  }
String courseIdget(){
 
  return coursesController.courseid!;
}
  Future<void> showOptions(String questionId) async {
    try {
      if (!isLoading) {
        isLoading = true;
        final url = Uri.parse('$baseUrl/show-options-quiz?question_id=$questionId');
        final response = await http.get(
          url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final String fetchedOptions = responseData['options'];
          options.add(fetchedOptions);
          currentPage++;

          saveOptionsToCache(options.toString());
        } else {
          isLoading = false;
        }
      }
    } catch (e) {
      isLoading = false;
    }
  }

  Future<void> showQuizQuestion() async {
    try {
      final url = Uri.parse('$baseUrl/show-quiz-question?course_id=$courseId&page=$currentPage'); // Changed to course_id
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        questions.add(responseData); // Add fetched question to the list
        currentPage++;

        saveQuestionToCache(responseData);
      }
    } catch (e) {
      // Handle error
    }
  }
  Future<void> getOptionsFromCache() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedData = prefs.getString(optionsCacheKey);
      if (cachedData != null) {
        final data = jsonDecode(cachedData);
        options.addAll(data); // Add cached options to the list
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveOptionsToCache(String options) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(optionsCacheKey, jsonEncode(options));
    } catch (e) {
      // Handle error
    }
  }

  Future<void> getQuestionsFromCache() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedData = prefs.getString(questionsCacheKey);
      if (cachedData != null) {
        final data = jsonDecode(cachedData);
        questions.addAll(data); // Add cached questions to the list
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveQuestionToCache(Map<String, dynamic> question) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(questionsCacheKey, jsonEncode(question));
    } catch (e) {
      // Handle error
    }
  }
}
