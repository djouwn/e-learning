import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/views/onboarding/background.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  const EdgeInsets.all(20.0),
              child: Text(
                'Join Us as Student'.tr,
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 36,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset("assets/images/tutor1.png"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'By LearnFast'.tr,
                style: GoogleFonts.comforter(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
            ),
          
                
              
            
          ],
        ),
      ],
    );
  }
}
