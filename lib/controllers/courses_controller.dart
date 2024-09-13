import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learnfast/model/course_model.dart';

class CoursesController extends GetxController {
  RxList<Course> courses = <Course>[].obs;
  RxList<Tutor> tutors = <Tutor>[].obs;
  int loadedPages = 1;
  bool isLoading = false;
  final ScrollController scrollController = ScrollController();
  final String cacheKey = 'cache_courses';

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    getCourses();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void scrollListener() {
    if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
      getCourses();
    }
  }

  Future<void> getCourses({int perPage = 10}) async {
    try {
      if (!isLoading) {
        isLoading = false;

        final response = await http.get(
          Uri.parse('http://192.168.1.13:5000/courses?page=$loadedPages&per_page=$perPage'),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          List<Course> newCourses = List<Course>.from(data['courses'].map((c) => Course.fromJson(c)));
          List<Tutor> newTutors = List<Tutor>.from(data['tutors'].map((t) => Tutor.fromJson(t)));

          courses.addAll(newCourses);
          tutors.addAll(newTutors);
          loadedPages++;
          isLoading = true;

          saveCoursesToCache();
        } else {
          throw Exception('Failed to fetch courses');
        }
      }
    } catch (e) {
      throw Exception('Error fetching courses: $e');
    }
  }

  Future<void> getCoursesFromCache() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedData = prefs.getString(cacheKey);
      if (cachedData != null) {
        final data = json.decode(cachedData);
        courses = RxList<Course>.from(data['courses'].map((c) => Course.fromJson(c)));
        tutors = RxList<Tutor>.from(data['tutors'].map((t) => Tutor.fromJson(t)));
      } else {
        getCourses();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error reading cache: $e');
      }
    }
  }

  Future<void> saveCoursesToCache() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<dynamic> coursesJson = courses.map((course) => course.fromJson()).toList();
      List<dynamic> tutorsJson = tutors.map((tutor) => tutor.fromJson()).toList();
      String data = json.encode({'courses': coursesJson, 'tutors': tutorsJson});
      await prefs.setString(cacheKey, data);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving to cache: $e');
      }
    }
  }
  String? get courseid => courses.isNotEmpty ? courses[0].id : null;
  // Methods to access tutor information
  String? get tutorImageUrl => tutors.isNotEmpty ? tutors[0].imageUrl : null;
  String? get tutorName => tutors.isNotEmpty ? tutors[0].name : null;
  bool? get isTutorExperienced => tutors.isNotEmpty ? tutors[0].isActive : null;

  getTutorsForCourse(String? id) {
    return tutors;
  }
}
