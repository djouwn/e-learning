import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/traduction/local_controller.dart';
import 'package:learnfast/views/onboarding/background.dart';
import 'package:learnfast/views/onboarding/fourth_page.dart';
import 'package:learnfast/views/onboarding/second_page.dart';
import 'package:learnfast/views/onboarding/third_page.dart';


// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
   FirstPage({super.key});
MyLocalController loca=Get.put(MyLocalController());
  @override
  Widget build(BuildContext context) {
    return
    PageView(children: [
     Background(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Learning can be funny !'.tr,
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 36,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset("assets/images/learning.png"),
            Padding(
              padding:  const EdgeInsets.all(20.0),
              child: Text(
                'By LearnFast'.tr,
                style: GoogleFonts.comforter(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 27),
                ),
              )            ),
         ElevatedButton(onPressed: (){
loca.changeLang("ar");
         }, child: const Text("transmate"))
          ])
            
          ],
        ),
        const SecondPage(),
         const ThirdPage(),
         const FourthPage()
                
      ],
    );
  }
}
