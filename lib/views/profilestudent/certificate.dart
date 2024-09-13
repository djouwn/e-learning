import 'package:flutter/material.dart';



class Certificat extends StatelessWidget {
  const Certificat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 22,
                top: 48,
                child: Container(
                  width: 316,
                  height: 208,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(0, 1),
                      radius: 0,
                      colors: [Color(0xFF435EF3), Color(0xFF0025FF)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 143,
                top: 60,
                child: Container(
                  width: 217,
                  height: 208,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/217x208"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 42,
                top: 78,
                child: Text(
                  'Get Your \nCertificate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Comic Neue',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 288,
                child: Text(
                  'Download Your\nCertificate',
                  style: TextStyle(
                    color: Color(0xFF0025FF),
                    fontSize: 24,
                    fontFamily: 'Comic Neue',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 364,
                child: Container(
                  width: 299,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/299x250"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 104,
                top: 666,
                child: Text(
                  'See Certificate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
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