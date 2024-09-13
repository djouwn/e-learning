import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Successful extends StatelessWidget {
  const Successful({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(body:
      Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, 1),
              radius: 0,
              colors: [Color(0xFF4662FA), Color(0xFF0025FF)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Stack(
              children: [
                 Positioned(
                  left: 126,
                  top: 299,
                  child: Text(
                    'Great Beat ',
                    style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.bold),),
                  ),
                ),
                Positioned(
                  left: 132,
                  top: 330,
                  child:

                  Text(
                    'Congrats!',textAlign: TextAlign.center,
                    style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.amber,fontSize:24,fontWeight: FontWeight.bold),),
                  ),
                ),
                Positioned(
                  left: 63,
                  top: 387,
                  child: Text(
                    "Congratulations on your achievement! \nYou've truly earned this moment of \ncelebration.",
                    textAlign: TextAlign.center,
                    style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontSize:16,fontWeight: FontWeight.bold),),
                  ),
                ),
                Positioned(
                  left: 3,
                  top: 135.04,
                  child: Transform(
                    transform: Matrix4.identity()..translate(3.5, -50.0)..rotateZ(-0.22),
                    child: SizedBox(
                      width: 153.88,
                      height: 167.40,
                      child: Image.asset("assets/images/couronne.png"),
                      ),
                    ),
                  ),

                Positioned(
                  left: 118,
                  top: 135,
                  child: Container(
                    width: 132,
                    height: 141,
                    decoration: const ShapeDecoration(
                     
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 9,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFFFFCD46),
                        ),
                      ),
                    ),
                    child: Image.asset("assets/images/tutor1.png",
                    fit: BoxFit.fill,

                    ),
                  ),
                ),
                Positioned(
                  left: 66,
                  top: 658,
                  child: Container(
                    width: 236,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 132,
                  top: 676,
                  child: Text(
                    'Congrats !',
                    style: TextStyle(
                      color: Color(0xFF0025FF),
                      fontSize: 20,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.40,
                    ),
                  ),
                ),
                Positioned(
                  left: 37,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 114,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 191,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 268,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 60,
                  top: 518,
                  child: Text(
                    'G',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                const Positioned(
                  left: 138,
                  top: 518,
                  child: Text(
                    'O',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                const Positioned(
                  left: 214,
                  top: 518,
                  child: Text(
                    'O',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                const Positioned(
                  left: 295,
                  top: 518,
                  child: Text(
                    'D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                Positioned(
                  left: 37,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 114,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 191,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 268,
                  top: 500,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 60,
                  top: 518,
                  child: Text(
                    'G',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                const Positioned(
                  left: 138,
                  top: 518,
                  child: Text(
                    'O',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                const Positioned(
                  left: 214,
                  top: 518,
                  child: Text(
                    'O',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                const Positioned(
                  left: 295,
                  top: 518,
                  child: Text(
                    'D',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Comic Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                ),
                Positioned(
                  left: 114,
                  top: 584,
                  child: Text(
                    'Acheivement',
                    style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.bold,

                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                  ),)
              ],
            ),
          ),
        ),
      ],
    )));
  }
}