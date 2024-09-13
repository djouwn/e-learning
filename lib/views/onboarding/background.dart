import 'package:flutter/material.dart';
import 'package:learnfast/constants/colors.dart';




class Background extends StatelessWidget {
  final List<Widget>? children;

  const Background({super.key, this.children});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(resizeToAvoidBottomInset: false,
        body: SafeArea(
          child:SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            margin:const EdgeInsets.all(20.0,),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: RadialGradient(
                colors: [AppColors.coursewidget, AppColors.blueofgradient2],
                center: Alignment.center,
                radius: 0.7,
              ),
              borderRadius: BorderRadius.zero,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: children ?? [], 
            ),
          ),
        ),
      ));
  }
}
