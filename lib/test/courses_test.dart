import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/courses_controller.dart';
import 'package:learnfast/model/course_model.dart';
import 'package:learnfast/views/profilestudent/course_details.dart';

import '../controllers/course_details.dart';


class CoursesTest extends StatelessWidget {
  final CoursesController coursesController = Get.put(CoursesController());
  final CoursesDetailsFetchController coursesdetails =
  Get.put(CoursesDetailsFetchController());

  CoursesTest({super.key}); // Added Key? type

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesController>(
      init: coursesController,
      builder: (_) => buildCoursesList(context),
    );
  }

  Widget buildCoursesList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 20) / 2;
    final double itemWidth = size.width / 2;

    return Obx(
          () => GridView.builder(
            shrinkWrap: true,
        controller: coursesController.scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 18.0,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: coursesController.courses.length,
        itemBuilder: (context, index) {
          final course = coursesController.courses[index];
          return buildCourseTile(course);
        },
      ),
    );
  }

  Widget buildCourseTile(Course course) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                course.imageUrl ?? 'https://yt3.googleusercontent.com/ytc/AIdro_nqx_sCd8ZIeIcodS0sfeMKJ8rVTslmQHUe_udwGNH2Pg=s900-c-k-c0x00ffffff-no-rj',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(course.title ?? '', style: const TextStyle(fontSize: 12)),
            ),
            Text(course.description ?? '', style: const TextStyle(fontSize: 12)),
            buildTutorsList(),
            InkWell(
              onTap: () {
                coursesdetails.fetchCourseDetails(course.id);
                Get.to(CourseDetails(courseId: course.id ?? ''));
              },
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFFFFCD46), Color(0xFFFAB807)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(child: Text("See Details")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTutorsList() {
    final CoursesController coursesController = Get.put(CoursesController());

    return SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: coursesController.tutors.length,
        itemBuilder: (context, index) {
          final tutor = coursesController.tutors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(tutor.imageUrl ?? ''),
                  radius: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tutor.name?.capitalize ?? '', style: const TextStyle(fontSize: 12), textAlign: TextAlign.start,),
                    if (tutor.isActive != false)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Experienced Tutor", style: TextStyle(fontSize: 12)),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Tutor {
  final String name;
  final String imageUrl;

  Tutor({required this.name, required this.imageUrl});

  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
