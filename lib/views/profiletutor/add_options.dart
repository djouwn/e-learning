import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/add_course_controller.dart';
import 'package:learnfast/controllers/add_questions.dart';
import 'package:learnfast/controllers/add_quiz_options.dart';
import 'package:learnfast/views/profilestudent/menu.dart';

// ignore: must_be_immutable
class AddOptions extends StatelessWidget {
  final String courseId;
 String questionId;
  final MenuController menucontroller = Get.put(MenuController());
  final AddQuestionsController addquestions = Get.put(AddQuestionsController());
  final QuizzOptionsController addquizzOptions = Get.put(QuizzOptionsController());

  AddOptions({super.key, required this.questionId,required this.courseId, });

  final _formKey = GlobalKey<FormState>();
  final AddCoursesController addcourseController = Get.put(AddCoursesController());
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController requirementsController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController rightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Text(
                  "Add Quiz Options".tr,
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
                      colors: [AppColors.coursewidget, AppColors.blueofgradient2],
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
                          "Let them Be\nConfused ! ".tr,
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
                        top: -80,
                        right: -60,
                        child: SizedBox(
                          width: 450,
                          height: 450,
                          child: Image.asset("assets/images/quizz.png"),
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
                     
                      
                    Column(
  children: List.generate(
    2, // Assuming you always have two text fields for quiz options and right answers
    (index) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          controller: index == 0 ? purposeController : rightController,
          maxLines: 2,
          maxLength: 30,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefix: Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: const Icon(Icons.email, color: Colors.blue),
            ),
            hintText: index == 0 ? "Options separated by a Comma".tr : "Right Answers separated by a Comma".tr,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return index == 0 ? 'Please enter your quiz options'.tr : 'Please enter the right answers'.tr;
            }
            return null;
          },
        ),
      );
    },
  )),
           Padding(
                        padding: const EdgeInsets.only(top: 20, left: 80, right: 80),
                        child: Container(
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
                               // addquestions.addQuestions(courseId, courseNameController.text, requirementsController.text);
                                addquizzOptions.addOptions(questionId, purposeController.text.split(','), rightController.text.split(',')); // You need to define 'rightAnswers'
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Add Quiz',
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
                      ),
                    ],
                  ),
                ),
    )])),
             bottomNavigationBar: GetBuilder<BottomNavController>(
          init: controller,
          builder: (_) => CurvedNavigationBar(
            backgroundColor: AppColors.whiteofgradeint,
            color: AppColors.bluebutton, // Change color to white
            index: _.pageIndex.value,
            items: const [
              Icon(Icons.chat, size: 30, color: Colors.white), // Set color to white
              Icon(Icons.home, size: 30, semanticLabel: '', color: Colors.white), // Set color to white
              Icon(Icons.person, size: 30, color: Colors.white), // Set color to white
            ],
            onTap: (index) => _.changePage(index),
          ),
        ),
            ));
  }
}
