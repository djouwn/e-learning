import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/list_institution.dart';


class InstitutionsPage extends StatelessWidget {
  final FetchInstitutionsController fetchInstitutionsController =
      Get.put(FetchInstitutionsController());
  final ScrollController _scrollController = ScrollController();

  InstitutionsPage({super.key}) {
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!fetchInstitutionsController.isLoading) {
        fetchInstitutionsController.fetchInstitutions();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institutions'),
      ),
      body: Obx(() {
        if (fetchInstitutionsController.isLoading &&
            fetchInstitutionsController.institutions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: fetchInstitutionsController.institutions.length,
            itemBuilder: (context, index) {
              final institution =
                  fetchInstitutionsController.institutions[index];
              return ListTile(
                title: Text(institution),
                subtitle: Text(institution),
             
              );
            },
          );
        }
      }),
    );
  }
}
