import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/upload_video_controller.dart';
import 'dart:io';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler package

// ignore: must_be_immutable
class UploadVideosTest extends StatelessWidget {
  String questionId;
  String courseId;
  UploadVideosTest({super.key, required this.courseId,required this.questionId});

  final UploadVideosController uploadVideosController =
  Get.put(UploadVideosController());

  @override
  Widget build(BuildContext context) {
    List<File>? videoFiles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Videos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Check and request storage permission before selecting files
                var status = await Permission.storage.request();
                if (status.isGranted) {
                  // Permission granted, proceed with file selection
                  videoFiles = await selectFilesAndroid();
                } else {
                  // Permission denied
                  Get.snackbar("Permission Denied", "Storage permission is required to select files");
                }
              },
              child: const Text('Select Videos'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (videoFiles != null ) {
                  uploadVideosController.uploadVideos(courseId, videoFiles!);
                } else {
                  Get.snackbar("Error", "Please select videos first");
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<File>?> selectFilesAndroid() async {
    List<File>? videoFiles;

    FilePickerResult? result =
    await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      videoFiles = result.paths.map((path) => File(path!)).toList();
    }

    return videoFiles;
  }
}
