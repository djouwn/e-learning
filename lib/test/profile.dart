

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/fetch_profiles.dart';
import 'package:learnfast/controllers/logout.dart';
import 'package:learnfast/test/show_enrolled.dart';
import 'package:learnfast/traduction/local_controller.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  final FetchProfileController fetchProfileController = Get.put(FetchProfileController());
  MyLocalController local=Get.put(MyLocalController());
AuthController logout=Get.put(AuthController());
  ProfilePage({super.key}) {
    fetchProfileController.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final screenWidth = mediaquery.width;
    final screenheight = mediaquery.height;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: screenWidth,
          height: screenheight,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Profile".tr,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: AppColors.bluebutton),
                ),
              ),
              Positioned(
                top: 50,
                child: Container(
                  width: screenWidth,
                  height: 200,
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.coursewidget,
                        AppColors.blueofgradient2
                      ],
                      center: Alignment.center,
                      radius: 0.7,
                    ),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Text(
                  'Check your Profile'.tr,
                  style: GoogleFonts.comicNeue(
                    textStyle: const TextStyle(
                        color: AppColors.whiteofgradeint,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 90,
                right: 0,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/tutor1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 310,
                right: 40,
                left:40,
                child: InkWell(
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>EnrollmentPageStudent()));
                  },
                  child: Container(
                    width: 309,
                    height: 73,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        Text("Enrolled Courses".tr,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ),
                Positioned(
                top: 400,
                right: 40,
                left:40,
                child: InkWell(
                 onTap: (){
local.changeLang("en");
                 },
                  child: Container(
                    width: 309,
                    height: 73,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        Text("Logout".tr,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ),
            
              Align(
                alignment: Alignment.bottomRight,
                child:

                    Expanded(
                      child: GetBuilder<FetchProfileController>(
                        init: FetchProfileController(), // Initialize your controller
                        builder: (controller) {
                          // Check if profiles are fetched
                          if (controller.allMyProfile.isEmpty) {
                            // Display loading indicator while fetching profiles
                            return const Text("error");
                          } else {
                            // Display fetched profiles
                            // Customize how each profile is displayed
                            return ListTile(
                              title: Text("Email  ${controller.allMyProfile[0][3]}".tr,style:const TextStyle(fontSize: 17),),
                              subtitle: Text("Name: ${controller.allMyProfile[0][1]}".tr,style:const TextStyle(fontSize: 17,color: Colors.black),),
                            );
                          }
                        },
                      ),
                    ),

                ),

            ],
          ),
        ),
      ),
    );
  }
}
