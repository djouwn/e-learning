import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/test/list_users_for_admin.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: 200,
                    margin: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.coursewidget,
                          AppColors.blueofgradient2
                        ],
                        center: Alignment.center,
                        radius: 0.7,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Text(
                      'See users \n in your Platform',
                      style: GoogleFonts.comicNeue(
                        textStyle: const TextStyle(
                            color: AppColors.whiteofgradeint,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets/images/admin.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: UserListPage(),
            )
          ],
        ),
      ),
    );
  }
}
