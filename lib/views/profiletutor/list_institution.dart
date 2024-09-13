import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/join_institut.dart';
import 'package:learnfast/controllers/login.dart';
import '../../controllers/institution_controller.dart';

class HomePage extends StatelessWidget {
  final InstitutionController _institutionController = Get.put(InstitutionController());
  final JoinInstitutController join = Get.put(JoinInstitutController());
  final LoginController login = Get.put(LoginController());

  HomePage({Key? key}) : super(key: key){
    _institutionController.fetchInstitutions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Institutions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (_institutionController.institutions.isEmpty) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _institutionController.institutions.length,
                    itemBuilder: (context, index) {
                      var institutionItem = _institutionController.institutions[index];
                      return ListTile(
                        title: Text(institutionItem),
                       
                        onTap: () {
                          final Future<String?> token = login.gettoken();
                          final Future<String?> userid=login.getuserid(token.toString());
                          join.joinInstitution(userid.toString(), institutionItem[0]);
                        },
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the method to fetch institutions
          _institutionController.fetchInstitutions();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
