import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/views/authentication/login.dart';
import 'package:learnfast/views/onboarding/background.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Join Us as Tutor',
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 36,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset("assets/images/tuteur.png"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'By LearnFast',
                style: GoogleFonts.comforter(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
            ),
            Transform.scale(
              scaleY: 1,
              scaleX: 1.5,
           
              child: PhysicalModel(
                color: AppColors.whiteofgradeint,
                elevation: 8,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(2),
                child: Transform.scale(
                  scaleX:0.5,
                  scaleY: 0.8,
                  child:  InkWell(
                    onTap:(){
Get.to(Login());
                    },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                'Continue',
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(color: AppColors.bluebutton, fontSize: 36,fontWeight: FontWeight.bold),
                ),
              ),
                  ),),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
