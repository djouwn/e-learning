import 'package:flutter/material.dart';



class YourCourses extends StatelessWidget {
  const YourCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              const Positioned(
                left: 20,
                top: 84,
                child: SizedBox(
                  width: 150,
                  height: 22,
                  child: Text(
                    'Your courses',
                    style: TextStyle(
                      color: Color(0xFF07122A),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: -0.10,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 20,
                top: 578,
                child: SizedBox(
                  width: 314,
                  height: 22,
                  child: Text(
                    'Learn more way faster',
                    style: TextStyle(
                      color: Color(0xFF07122A),
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.06,
                      letterSpacing: -0.10,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 115.38,
                top: 177.46,
                child: Opacity(
                  opacity: 0.20,
                  child: Transform(
                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.73),
                    child: Container(
                      width: 174.27,
                      height: 174.27,
                      decoration: ShapeDecoration(
                        gradient: RadialGradient(
                          center: const Alignment(0.37, 0.54),
                          radius: 0.35,
                          colors: [Colors.white, Colors.white.withOpacity(0)],
                        ),
                        shape: const OvalBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 244,
                top: 230.97,
                child: Opacity(
                  opacity: 0.10,
                  child: Transform(
                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.53),
                    child: Container(
                      width: 155.69,
                      height: 156.13,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 257.70,
                top: 191.03,
                child: Opacity(
                  opacity: 0.20,
                  child: Transform(
                    transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.35),
                    child: Container(
                      width: 131.01,
                      height: 131.58,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 70.16,
                top: 165.82,
                child: SizedBox(
                  width: 32.73,
                  height: 49.09,
                  child: Stack(children: [

                      ]),
                ),
              ),
              const Positioned(
                left: 24,
                top: 269,
                child: SizedBox(
                  width: 142,
                  height: 16,
                  child: Text(
                    'UI/UX on Figma',
                    style: TextStyle(
                      color: Color(0xFF07122A),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 171,
                top: 269,
                child: SizedBox(
                  width: 142,
                  height: 16,
                  child: Text(
                    'Flutter workshop',
                    style: TextStyle(
                      color: Color(0xFF07122A),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 323,
                top: 269,
                child: SizedBox(
                  width: 142,
                  height: 16,
                  child: Text(
                    'Atlassian',
                    style: TextStyle(
                      color: Color(0xFF07122A),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 24,
                top: 286,
                child: Text(
                  'by Christopher D.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 171,
                top: 286,
                child: Text(
                  'by Katalina C.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 323,
                top: 286,
                child: Text(
                  'by Florian H.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 372,
                top: 177,
                child: Opacity(
                  opacity: 0.30,
                  child: Container(
                    width: 8,
                    height: 38,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 217,
                top: 164,
                child: Container(
                  width: 42,
                  height: 53,
                  padding: const EdgeInsets.symmetric(vertical: 0.04),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 42,
                        height: 52.92,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: SizedBox(
                                width: 41.74,
                                height: 46.59,
                                child: Stack(children: [

                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 346,
                child: SizedBox(
                  width: 342,
                  height: 189,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 5,
                        top: 0,
                        child: SizedBox(
                          width: 314,
                          height: 22,
                          child: Text(
                            'Personal statistics',
                            style: TextStyle(
                              color: Color(0xFF07122A),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.06,
                              letterSpacing: -0.10,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 39,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F5F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 192,
                        top: 39,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F5F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 39,
                        top: 60,
                        child: SizedBox(
                          width: 66,
                          height: 96,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 15,
                                top: 0,
                                child: Text(
                                  '11',
                                  style: TextStyle(
                                    color: Color(0xFF00169B),
                                    fontSize: 46,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 60,
                                child: Text(
                                  'Added \nCourses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF00169B),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 237,
                        top: 60,
                        child: SizedBox(
                          width: 60,
                          height: 96,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 0,
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Color(0xFF00169B),
                                    fontSize: 46,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 60,
                                child: Text(
                                  'Added \nQuizzes',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF00169B),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 621,
                child: Container(
                  width: 337,
                  height: 58,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 337,
                          height: 58,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0025FF),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 58,
                        top: 22,
                        child: SizedBox(
                          width: 222,
                          height: 36,
                          child: Text(
                            'Browse Courses\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 344,
                top: 163,
                child: Opacity(
                  opacity: 0.10,
                  child: Container(
                    width: 22,
                    height: 37,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 743,
                child: Opacity(
                  opacity: 0.30,
                  child: Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(2.50),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 315,
                top: 747,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
                  child: Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}