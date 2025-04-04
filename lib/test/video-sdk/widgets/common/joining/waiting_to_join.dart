import 'package:flutter/material.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/test/video-sdk/utils/spacer.dart';
import 'package:lottie/lottie.dart';


class WaitingToJoin extends StatelessWidget {
  const WaitingToJoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bluebutton,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           // Lottie.asset("assets/joining_lottie.json", width: 100),
            const VerticalSpacer(20),
            const Text("Creating a Room",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
