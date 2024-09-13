import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/added_courses.dart';


class CheckAddedCoursesPage extends StatelessWidget {
  final AddeCoursesByTutor addeCoursesByTutor = Get.put(AddeCoursesByTutor());
  final String tutorId;

  CheckAddedCoursesPage({super.key, required this.tutorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Added Courses'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: addeCoursesByTutor.checkAddedCourses(tutorId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<dynamic> addedCourses = snapshot.data ?? [];
              return ListView.builder(
                itemCount: addedCourses.length,
                itemBuilder: (context, index) {
                  String courseName = addedCourses[index][0];
                  String courseId = addedCourses[index][1];
                  return ListTile(
                    title: Text(courseName),
                    subtitle: Text(courseId),
                    // You can add more details or actions for each course here
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
