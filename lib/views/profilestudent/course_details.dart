import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/course_details.dart';

import 'package:video_player/video_player.dart';

import '../../controllers/courses_controller.dart';
import '../../controllers/enrollement_controller.dart';
import '../../controllers/favourite_controller.dart';
import '../../controllers/videos_controller.dart';
import '../../test/video_page.dart';

// ignore: must_be_immutable
class CourseDetails extends StatelessWidget {
  final String courseId;
  CoursesDetailsFetchController coursesdetails =
      Get.put(CoursesDetailsFetchController());
  CoursesController coursescontroller = Get.put(CoursesController());
  EnrollementController enrollementController =
      Get.put(EnrollementController());
     
  FavouriteController favouritecontroller = Get.put(FavouriteController());
  CourseDetails({super.key, required this.courseId}) {
    coursesdetails.fetchCourseDetails(courseId);
    
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                    width: screenWidth,
                    height: 200,
                     child:const FirstVideoApp()
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 210,
                  child: Text(
                    coursesdetails.course.title ?? '',
                    style: const TextStyle(
                      color: AppColors.bluebutton,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                
                const Positioned(
                  left: 22,
                  top: 230,
                  child: Text(
                    'What you will Learn?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
               
                 bottom: 20,
                  child: InkWell(
                      child: Container(
                        width: 255,
                        height: 60,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF0025FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Center(child: Text(
                    'Enroll Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    
                      ),
                        ),),),
                      onTap: () {
                        if (kDebugMode) {
                          print("tapped");
                        }
              
                        enrollementController.enroll(coursesdetails.course.id!);
                        Get.to(VideoScreen(courseId: coursesdetails.course.id!,));
                      }),
                ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  child: InkWell(
                    onTap: () {
                      favouritecontroller.addtofavourite(courseId);
                    },
                    child: Container(
                      width: 67.27,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFCD46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                
                
                Positioned(
                  left: 17,
                  right: 17,
                  top: 310,
                  child: Container(
                    width: screenWidth,
                    height: 64,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.99, -0.12),
                        end: Alignment(-0.99, 0.12),
                        colors: [Color(0xFF94A4F9), Color(0xFF0025FF)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 17,
                  right: 17,
                  top: 380,
                  child: Container(
                    width: screenWidth,
                    height: 64,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.99, -0.12),
                        end: Alignment(-0.99, 0.12),
                        colors: [Colors.white, Colors.white],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  top: 250,
                  child: Text(
                    coursesdetails.course.requirements ?? '',
                    style: const TextStyle(
                      color: Color(0xFF878080),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 41,
                  top: 320,
                  child: Text(
                    'Introduction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 43,
                  top: 340,
                  child: SizedBox(
                    width: 139,
                    height: 41,
                    child: Text(
                      'watch now!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 41,
                  top: 410,
                  child: SizedBox(
                    width: 139,
                    height: 41,
                    child: Text(
                      'watch now!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 24,
                  top: 270,
                  child: Text(
                    'Requirements:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 26,
                  top: 290,
                  child: Text(
                    coursesdetails.course.description ?? '',
                    style: const TextStyle(
                      color: Color(0xFF7C5C5C),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const Positioned(
                  left: 39,
                  top: 390,
                  child: Text(
                    'UI/UX Design-Enter Level',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstVideoApp extends StatefulWidget {
  const FirstVideoApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstVideoAppState createState() => _FirstVideoAppState();
}

class _FirstVideoAppState extends State<FirstVideoApp> {
  String? courseId;
  late VideoPlayerController _controller;
  VideoController videoController = Get.put(VideoController());
  @override
  void initState() {
    super.initState();
    videoController.fetchVideos(courseId: courseId ?? '');
    _controller = VideoPlayerController.networkUrl(Uri.parse(//videoController
           // .videos[0].url ??
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
