import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/views/onboarding/background.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

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
                'Join Us as Institution',
                style: GoogleFonts.comicNeue(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 36,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset("assets/images/institut.png"),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(
                'By LearnFast',
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
