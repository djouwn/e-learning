import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/change_color_container.dart';
import 'package:learnfast/controllers/specialized_in.dart';

import '../../controllers/add_preferences.dart';

// ignore: must_be_immutable
class WelcomeInstitut extends StatelessWidget {
   WelcomeInstitut({super.key});
    PreferencesController preferncesController=Get.put(PreferencesController());
YourController controller=Get.put(YourController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hello Institut",
                  style: GoogleFonts.comicNeue(
                    textStyle: const TextStyle(
                      color: AppColors.bluebutton,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                gradient: RadialGradient(
                  colors: [AppColors.coursewidget, AppColors.blueofgradient2],
                  center: Alignment.center,
                  radius: 0.7,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Text(
                      "Tell Us more\nabout yourself !",
                      style: GoogleFonts.comicNeue(
                        textStyle: const TextStyle(
                          color: AppColors.whiteofgradeint,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: Image.asset("assets/images/helloinstitut.png"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "What do you really want to learn?",
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Expanded(
              child: 
                                  FutureBuilder(
              future: controller.fetchSpecialite(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 3 / 1,
                      ),
                      itemCount: controller.options.length,
                      itemBuilder: (context, index) {
                        return buildOption(controller.options[index],index);
                      },
                    ),
                  );
                }
              },
            ),
                
              
            ),
            ElevatedButton(onPressed: () { 
preferncesController.addPreferences(controller.options);
             }, child: const Text("Validate"),

              
            )
          ],
        ),
      ),
    );
  }
}
/*
class ListOfSpeciality extends StatefulWidget {
  const ListOfSpeciality({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListOfSpecialityState createState() => _ListOfSpecialityState();
}

class _ListOfSpecialityState extends State<ListOfSpeciality> {
  ColorController colorcontroller = Get.put(ColorController());
  List<String> items = ["UI/UX", "Flut", "UI", "Flutter"];
  List<String> choosen = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: (itemWidth / itemHeight) * 4.5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        bool isSelected = choosen.contains(items[index]);
        return SizedBox(
          height: 30,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  choosen.remove(items[index]);
                  colorcontroller.changeBackgroundColor(Colors.white);
                } else {
                  choosen.add(items[index]);
                  colorcontroller.changeBackgroundColor(AppColors.bluebutton);
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: isSelected ? AppColors.bluebutton : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
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
                  )
                ],
              ),
              child: Center(
                child: Text(
                  items[index],
                  style: GoogleFonts.comicNeue(
                    textStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*/
 

 Widget buildOption(String option, int index) {
  YourController controller = Get.find<YourController>();
 
  ColorController colorController=Get.put(ColorController());
  return GestureDetector(
    onTap: () {
    colorController.addChild(option);
      controller.toggleIndex(index); // Toggle the selection of the option

      if (kDebugMode) {
        print('Selected option: $option');
      }
    },
    child: Obx(() {
      bool isSelected = controller.selectedIndexes.contains(index); // Check if this option is selected
      return Container(
       // Apply color if this option is selected
        margin:const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
          color: isSelected ? AppColors.bluebutton :Colors.white ,
          boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
        ),
    ],
),
        child: Center(
          child: Text(
            option,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black), // Change text color if selected
          ),
        ),
      );
    }),
  );
}