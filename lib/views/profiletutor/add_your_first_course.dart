import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/add_course_controller.dart';
import 'package:learnfast/views/profiletutor/profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:path_provider/path_provider.dart';

class AddYourFirstCourse extends StatelessWidget {
  AddYourFirstCourse({super.key});

  final _formKey = GlobalKey<FormState>();
  final AddCoursesController addCourseController =
      Get.put(AddCoursesController());
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Text(
                  "Add your first Course",
                  style: GoogleFonts.comicNeue(
                    textStyle: const TextStyle(
                      color: AppColors.bluebutton,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          "Be the first tutor\nto add your\ncourse ",
                          style: GoogleFonts.comicNeue(
                            textStyle: const TextStyle(
                              color: AppColors.whiteofgradeint,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 18,
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset("assets/images/tutor.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: courseNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email, color: Colors.blue),
                          hintText: "Course Name...",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your course name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: requirementsController,
                        maxLines: 5,
                        maxLength: 50,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefix: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: const Icon(Icons.email, color: Colors.blue),
                          ),
                          hintText: "Requirements...",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your course requirements';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: purposeController,
                        maxLines: 5,
                        maxLength: 50,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefix: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: const Icon(Icons.email, color: Colors.blue),
                          ),
                          hintText: "Purpose...",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your course purpose';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                    //  const UploadVideos(),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.bluebutton,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 8),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              
     
  if (_formKey.currentState!.validate()) {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String? filePath = result.files.single.path;
      String fileName = result.files.single.name;
      if (filePath != null) {
        File file = File(filePath);

        // Create a temporary file
        final tempDir = await getTemporaryDirectory();
        final tempPath = tempDir.path;
        File tempFile = File('$tempPath/$fileName');
        
        // Write bytes to the temporary file
        await tempFile.writeAsBytes(await file.readAsBytes());

        addCourseController.addCourses(
          purposeController.text,
          courseNameController.text,
          requirementsController.text,
          tempFile,
        );
      }
    }
  }



                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Add Course',
                                style: GoogleFonts.comicNeue(
                                  textStyle: const TextStyle(
                                    color: AppColors.whiteofgradeint,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
       
        
       bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppColors.bluebutton,
            color: AppColors.bluebutton,
            animationDuration: const Duration(milliseconds: 300),
            index: 0,
            items: <Widget>[
              const Icon(Icons.add, size: 26, color: Colors.white),
              const Icon(Icons.message, size: 26, color: Colors.white),
              GestureDetector(
                onTap: () {
                  Get.to(ProfilePageTutor());
                },
                child: const Icon(Icons.person, size: 26, color: Colors.white),
              ),
            ],
          ),
    ));
  }
}

class UploadVideos extends StatelessWidget {
  const UploadVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 300.0),
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset("assets/images/vector.png"),
            const SizedBox(height: 20),
            const Text("Browse your files"),
            Text(
              "allowed extensions are jpg, png, jpeg, and svg",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(height: 10),
        //    const WidgetListview(),
          ],
        ),
      ),
    );
  }
}

class WidgetListview extends StatelessWidget {
  const WidgetListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2, 
      itemBuilder: (context, index) {
        return ListTile(
          title: uploadedfilesuccessfull(),
        );
      },
    );
  }
}

Widget uploadedfilesuccessfull() {
  return Container(
    width: double.infinity,
    height: 70,
    margin: const EdgeInsets.symmetric(horizontal: 40),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      color: AppColors.blueofgradient2,
    ),
    child: Stack(
      children: [
        Positioned(
          top: 10,
          left: 20,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: Colors.green,
              border: Border.all(
                width: 2.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 85,
          child: Text(
            "wijdene.png",
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: AppColors.whiteofgradeint,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
