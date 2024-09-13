import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/fetch_tutor_experience.dart';


class TutorExperiencePage extends StatelessWidget {
  final FetchTutorExperience fetchTutorExperience = Get.put(FetchTutorExperience());
  final String tutorId;

  TutorExperiencePage({super.key, required this.tutorId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Experience'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchTutorExperience.fetchTutorExperience(tutorId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final tutorExperience = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Tutor Name: ${tutorExperience['name']}'),
                  Text('Experience: ${tutorExperience['is_experienced']} years'),
                  // Add more details as needed
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
