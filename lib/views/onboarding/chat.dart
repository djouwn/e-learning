import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/views/onboarding/background.dart';
import 'package:learnfast/views/onboarding/second_page.dart';


class ChatMain extends StatelessWidget {
  const ChatMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Seek help to use App',
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 32,fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Align(alignment: Alignment.center,child:
            Image.asset("assets/images/chat-opening.png"),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'By LearnFast',
                style: GoogleFonts.comforter(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
            ),
            Align(alignment: Alignment.center,child:
            Transform.scale(
              scaleY: 1,
              scaleX: 1.5,
              // Adjust the scale factor as needed
              child: PhysicalModel(
                color: AppColors.whiteofgradeint,
                elevation: 8,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(2),
                child: Transform.scale(
                  scaleX:0.5,
                  scaleY: 0.8,
                  child:  InkWell(
                    onTap: (){
                      Get.to(const SecondPage());
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
            ),),
          ],
        ),
      ],
    );
  }
}
