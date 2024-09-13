import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';

import 'package:learnfast/controllers/courses_controller.dart';
import 'package:learnfast/controllers/fetch_profiles.dart';
import 'package:learnfast/test/courses_test.dart';
import 'package:learnfast/test/favourite_courses.dart';
import 'package:learnfast/test/profile.dart';


class CoursesPage extends StatelessWidget {
  final CoursesController controller = Get.put(CoursesController());
final FetchProfileController _profileController=Get.put(FetchProfileController());
  final HomeController menucontroller = Get.put(HomeController());

  CoursesPage({super.key}) {
    controller.getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello\n${_profileController.allMyProfile[0][1]}!",
                    style: GoogleFonts.comicNeue(
                      textStyle: const TextStyle(
                        color: AppColors.bluebutton,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
 CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      "${_profileController.allMyProfile[0][4]}",
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 200,
                  width: double.infinity,
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
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 20,
                        top: 20,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Find the best \n',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Online Courses',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 20,
                        child: Container(
                          width: 130,
                          height: 47,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [
                                Color(0xFF2E4DFC),
                                Color(0xFF1B2D96),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Start Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Comic Neue',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 90,
                        left: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'What would you like \nto learn today ?',
                              style: TextStyle(
                                color: Color(0xFF7C5C5C),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 0,
                        left: 0,
                        child: SizedBox(
                          width: 310,
                          height: 180,
                          child: Image.asset(
                            "assets/images/excited.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "Best Courses",
              style: GoogleFonts.comicNeue(
                textStyle: const TextStyle(
                    color: AppColors.bluebutton,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
           Expanded(child: CoursesTest())
          ])),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppColors.bluebutton,
          color: AppColors.bluebutton,
          animationDuration: const Duration(milliseconds: 300),
          index: menucontroller.pageIndex.value,
          items: <Widget>[
            const Icon(Icons.home, size: 26, color: Colors.white),
    GestureDetector(
      child: const Icon(Icons.favorite, size: 26, color: Colors.red)
      ,
    onTap: () {
     Get.to(FavouriteCoursesPage());
    },),
            const Icon(Icons.search, size: 26, color: Colors.white),
            const Icon(Icons.message, size: 26, color: Colors.white),
          GestureDetector(
            onTap: (){
              Get.to(ProfilePage());
            },
            child:  const Icon(Icons.person, size: 26, color: Colors.white),),
          ],
        ),
      ),
    )
    );
  }
}

class HomeController extends GetxController {
  var pageIndex = 0.obs;
  void changePage() {
    pageIndex++;
  }
}
