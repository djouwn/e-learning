
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/constants/colors.dart';

import '../controllers/upload_video_controller.dart';

class FilePickerDemo extends StatefulWidget {
  final String courseId;
  final String title;
  const FilePickerDemo(
      {super.key, required this.title, required this.courseId});

  @override
  State<FilePickerDemo> createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  late UploadVideosController addvideocontroller=Get.put(UploadVideosController());
  FilePickerResult? result;
  String? courseId;

  String? questionId;

  @override
  void initState() {
    super.initState();
    
    courseId = widget.courseId;
  }

  void selectFile(FilePickerResult? result) {
    if (result == null) {
      if (kDebugMode) {
        print("No file selected");
      }
    } else {
      setState(() {});
      for (var element in result.files) {
        if (kDebugMode) {
          print(element.name);
        }
        if (kDebugMode) {
          print(element.path);
        }
      }
    }
  }

  num b = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              
            
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
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
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Browse your files',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      const Center(
                     
                        child: Text(
                          'allowed extensions are\n jpg png jpeg and svg',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      InkWell(
                        onTap: () async {
                          result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
if (result != null && result!.count > 3) {
  // Slice the files to contain only the first 6
  result = FilePickerResult(result!.files.sublist(0, 3));
}
                          selectFile(result);
                        },
                        child: const Text("Upload File"),
                      ),
                      if (result != null)
                        
                               Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: result?.files.length ?? 0,
                                  itemBuilder: (context, index) {
                                    String fileName =
                                        result?.files[index].name ?? '';
                                    String truncatedName = fileName.length > 17
                                        ? fileName.substring(0, 17)
                                        : fileName;

                                    return 
                                    
                                    Container(
                            margin: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: AppColors.bluebutton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),]),child:
                                    Row(children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(
                                            bottom: 20, left: 20, right: 20,top: 20),
                                        decoration: const ShapeDecoration(
                                          color: Color(0xFFFFCD46),
                                          shape: OvalBorder(
                                            side: BorderSide(
                                                width: 3, color: Colors.white),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.verified,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            truncatedName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '${result!.files[index].size} bytes',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                    ]));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(height: 5);
                                  },
                                ),
                               ElevatedButton(
  onPressed: () {
    if (result != null) {
      List<File> files = result!.files.map((file) => File(file.path!)).toList();
      addvideocontroller.uploadVideos(courseId!, files);
    }
  },
  child: const Text("add videos"),
)

                              ],
                            ),
            ]),
                        ),
           ) ],
                  ),
                ),
              ),
            
          );
  }
}
