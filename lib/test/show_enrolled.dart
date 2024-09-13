import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/enrolled_courses.dart';

class EnrollmentPageStudent extends StatelessWidget {
  final EnrollmentController enrollmentController =
      Get.put(EnrollmentController());
  final String? studentId;
  final String? courseId;
  final String? enrollmentId;

  EnrollmentPageStudent(
      {super.key, this.studentId, this.courseId, this.enrollmentId}) {
    enrollmentController.fetchEnrollments(
        studentId: studentId, courseId: courseId, enrollmentId: enrollmentId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "Enrolled Courses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Browse your courses",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                "assets/images/enroll.png",
                width: 500,
                height: 200,
              ),
            ),
            Expanded(
              child: Center(
                child: Obx(() {
                  return enrollmentController.enrollments.isEmpty
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: enrollmentController.enrollments.length,
                          itemBuilder: (context, index) {
                            List<dynamic> enrollment =
                                enrollmentController.enrollments[index];
                            return Container(
                              width: 279,
                              height: 122,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: 
                                
                                  Image.network(
                                    enrollment[8].toString(),
                                  ),
                                
                                title: Text(enrollment[5].toString()),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(enrollment[6].toString()),
                                    Text(enrollment[7].toString()),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
