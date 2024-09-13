import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:learnfast/views/onboarding/first_page.dart';

import 'package:page_transition/page_transition.dart';

// ignore: camel_case_types
class Splash_Animated extends StatelessWidget {
   const Splash_Animated({super.key});

  @override
  Widget build(BuildContext context) {
        MediaQuery.of(context);
    return Stack(
      children: [
    
        AnimatedSplashScreen(
          splashIconSize: 400,
          backgroundColor: Colors.white,
          pageTransitionType: PageTransitionType.leftToRight,
          splashTransition: SplashTransition.fadeTransition,
          splash: const CircleAvatar(
            radius: 200,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/learnfast.png"),
          ),
          nextScreen: FirstPage(),
          duration: 5000,
          animationDuration: const Duration(seconds: 5),
        ),
      ],
    );
  }
}
