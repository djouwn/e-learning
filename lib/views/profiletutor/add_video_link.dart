import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_video_controller.dart';

class AddVideosPage extends StatefulWidget {
  final String courseId;

  const AddVideosPage({super.key, required this.courseId});

  @override
  // ignore: library_private_types_in_public_api
  _AddVideosPageState createState() => _AddVideosPageState();
}

class _AddVideosPageState extends State<AddVideosPage> {
  final AddVideosController addVideosController = Get.put(AddVideosController());

  List<List<TextEditingController>> videoNameControllersGroups = [[]];
  List<List<TextEditingController>> videoPathControllersGroups = [[]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < videoNameControllersGroups.length; i++)
                Column(
                  children: [
                    _buildFieldsGroup(i),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          videoNameControllersGroups[i].add(TextEditingController());
                          videoPathControllersGroups[i].add(TextEditingController());
                        });
                      },
                      child: const Text('Add More Fields'),
                    ),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    videoNameControllersGroups.add([]);
                    videoPathControllersGroups.add([]);
                  });
                  // Add videos using the last group of controllers
                  addVideosController.addvideos(videoNameControllersGroups.last.map((controller) => controller.text).toList().toString(), widget.courseId, videoPathControllersGroups.last.map((controller) => controller.text).toList().toString());
                },
                child: const Text('Add More Groups'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldsGroup(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < videoNameControllersGroups[index].length; i++)
          Column(
            children: [
              TextField(
                controller: videoNameControllersGroups[index][i],
                decoration: const InputDecoration(labelText: 'Video Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: videoPathControllersGroups[index][i],
                decoration: const InputDecoration(labelText: 'Video Path'),
              ),
              const SizedBox(height: 20),
            ],
          ),
      ],
    );
  }
}
