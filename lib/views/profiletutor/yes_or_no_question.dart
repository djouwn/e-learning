import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/login.dart';
import 'package:learnfast/controllers/update_comf_it.dart';
import 'package:learnfast/views/profiletutor/list_institution.dart';


// ignore: must_be_immutable
class YesNoQuestion extends StatelessWidget {
   YesNoQuestion({Key? key}) : super(key: key);
final LoginController login=Get.put(LoginController());
  final UpdateTutorInfo userController = Get.put(UpdateTutorInfo()); // Get the instance of UserController
 bool comf_it=false;
 bool experienced=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Are you comfortable using IT',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Call UserController to update user information
                    comf_it=true;
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Call UserController to update user information
                    comf_it=false;
                  },
                  child: const Text('No'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Are you an experienced Tutor ?',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Call UserController to update user information
                    experienced=true;
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Call UserController to update user information
                    experienced=false;
                  },
                  child: const Text('No'),
                ),
              ],
            ),
             ElevatedButton(
                  onPressed: () {
                     
                    // Append data and send request for 'No'
                    userController.updateUser( experienced, comf_it);
                    Get.to(HomePage());
                  },
                  child: const Text('No'),
                ),
          ],
        ),
      ),
    );
  }
}
