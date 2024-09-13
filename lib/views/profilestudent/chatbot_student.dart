import 'package:flutter/material.dart';



class AndroidLarge1 extends StatelessWidget {
  const AndroidLarge1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 28,
                child: Container(
                  width: 320,
                  height: 744,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(0, 1),
                      radius: 0,
                      colors: [Color(0xFF4C66F2), Color(0xFF0025FF)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -12,
                top: 163,
                child: Container(
                  width: 464,
                  height: 465,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/464x465"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 63,
                top: 87,
                child: Text(
                  'Seek help to\nuse app',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Comic Neue',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 63,
                top: 657,
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
                left: 116,
                top: 668,
                child: Text(
                  'Let’s Talk',
                  style: TextStyle(
                    color: Color(0xFF0025FF),
                    fontSize: 32,
                    fontFamily: 'Comic Neue',
                    fontWeight: FontWeight.w700,
                    height: 0,
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