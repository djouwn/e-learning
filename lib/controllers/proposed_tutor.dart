import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProposedTutorsController extends GetxController {
  final String apiUrl = 'http://192.168.1.13:5000';

  Future<List<Map<String, dynamic>>> fetchProposedTutors() async {
    const String fetchProposedTutorsEndpoint = '/fetch_proposed_tutors';
    final String fetchProposedTutorsUrl = '$apiUrl$fetchProposedTutorsEndpoint';

    try {
      final response = await http.get(Uri.parse(fetchProposedTutorsUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['proposed_tutors'];
        List<Map<String, dynamic>> proposedTutors = List<Map<String, dynamic>>.from(data);
        return proposedTutors;
      } else {
        throw 'Failed to fetch proposed tutors: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error fetching proposed tutors: $e';
    }
  }
}

class ProposedTutorsPage extends StatelessWidget {
  final ProposedTutorsController _controller = Get.put(ProposedTutorsController());

   ProposedTutorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proposed Tutors'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _controller.fetchProposedTutors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> tutors = snapshot.data!;
              return ListView.builder(
                itemCount: tutors.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> tutor = tutors[index];
                  return ListTile(
                    title: Text(tutor['name']),
                    subtitle: Text(tutor['subject']),
                    // Add more fields as needed
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}


