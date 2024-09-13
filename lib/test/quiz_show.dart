import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/calculate_score.dart';
import 'package:learnfast/controllers/show_question_quizzes.dart';
import 'package:learnfast/controllers/user_answers_controller.dart';

class QuizApplication extends StatelessWidget {
  final String courseId;
  QuizController quizController = Get.put(QuizController());

  QuizApplication({super.key,   required this.courseId}) {
    quizController.fetchQuizData(courseId);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: quizController,
      builder: (controller) => Scaffold(
       
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text('Question Names:'),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) {
                    final question = controller.questions[index];
                    return ListTile(
                      title: Text(question['question_name']),
                      trailing:  ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green, // Set button color to green
      elevation: 5, // Set elevation for shadow
      shadowColor: Colors.green.withOpacity(0.5), // Set shadow color
      shape: RoundedRectangleBorder( // Set button shape
        borderRadius: BorderRadius.circular(10),
      ),
    ),
     onPressed: () {
                        if (kDebugMode) {
                          print('Selected Question: $question');
                        }
                        Get.to(QuizPage(questionId: question['question_id']));
                      }, child: const Text("Respond on this Quizz"),
    ),
                     
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizController extends GetxController {
  var isLoading = true.obs;
  var questions = <Map<String, dynamic>>[].obs;

  Future<void> fetchQuizData(String courseId) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.1.13:5000/quiz?courseid=$courseId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (kDebugMode) {
          print('Server Response: $data');
        }
        questions.assignAll(data.cast<Map<String, dynamic>>());
        if (kDebugMode) {
          print('Parsed Data: $questions');
        }
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading(false);
    }
  }
}

class QuizPage extends StatelessWidget {
  final String questionId;
  UserAnswersController submit = UserAnswersController();
  final ShowQuizOptionsAndQuestionsAndScore controller =
      Get.put(ShowQuizOptionsAndQuestionsAndScore());
  CalculateScore calculs = Get.put(CalculateScore());

  QuizPage({super.key, required this.questionId}) {
    controller.showOptions(questionId);
    

  }
int ontappedtimes=0;
  List<String> answers = [];

  // Score variable
  int? score;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  'Let’s Start \nOur Challenge !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Comic Neue',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 1.68,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 400,
                decoration: ShapeDecoration(
                  gradient: const RadialGradient(
                    center: Alignment(0, 1),
                    radius: 0,
                    colors: [Color(0xFF94A4F9), Color(0xFF637AF8), Color(0xFF0025FF)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
                    ),
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
                child: Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.options.length,
                      itemBuilder: (context, index) {
                        List<String> optionParts = controller.options[index].split(',');
                        List<Widget> listTiles = optionParts.map((part) {
                          if (part.contains(')') || part.contains(']')) {
                            return const SizedBox.shrink(); // Skip this part
                          } else {
                            return GestureDetector(
                              onTap: () {
                                ontappedtimes++;
                                if(ontappedtimes==1){
                                  answers.add(part.trim());

Get.forceAppUpdate();

if (score != null) {
 
  answers.contains(part.trim()) ? Colors.red : Colors.white; 
  Get.forceAppUpdate();
} else {

  answers.contains(part.trim()) ? Colors.green : Colors.white; 
  Matrix4.rotationZ(answers.contains(part.trim()) ? 0.2 : 0); 
  Get.forceAppUpdate();
}

                                }
                             


                              },
                              child: AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  transform: answers.contains(part.trim()) ? Matrix4.rotationZ(0.2) : Matrix4.rotationZ(0),
  margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
  decoration: ShapeDecoration(
    color: score != null ? Colors.green : Colors.white, // Change color based on the score
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
  child: ListTile(
    title: Text(part.trim(), style: TextStyle(color: score != null ? Colors.white : Colors.black)),
  ),
),

                            );
                          }
                        }).toList();
                        return Column(children:[ ...listTiles,      
                        Container(
                          width: 300,
                          height: 50,
                          margin: const EdgeInsets.all(50),
                          child:
                         ElevatedButton(
                           style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // Set button color to blue
    elevation: 5, // Set elevation for shadow
    shadowColor: Colors.blue.withOpacity(0.5), // Set shadow color
    shape: RoundedRectangleBorder( // Set button shape
      borderRadius: BorderRadius.circular(10),
    ),
  ),
                onPressed: () async {
                  String? score = await submit.submitAnswers(answers, questionId);
                  if(ontappedtimes==1){
                  //calculs.calculateScore(questionId, answers);
                  
                  if (score != null) {
                    // Show the score in a dialog or another appropriate way
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Score'),
                          content: Text(score),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }else{
                     showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Score'),
                          content: const Text('Answer can Be only Submitted'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }},
                child: const Text("Submit Quiz",style: TextStyle(color: AppColors.bluebutton),),
              ))]);
                      },
                    );
                  }),
                ),
              ),
       
            ],
          ),
        ),
      ),
    );
  }
}
