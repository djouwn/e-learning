import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
class Failure extends  StatelessWidget{
  const Failure({super.key});


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return SafeArea(child: Scaffold(
      body: Container(
    width: screenWidth,
        height: screenHeight,

    decoration: const BoxDecoration(
    shape: BoxShape.rectangle,
    gradient: RadialGradient(
    colors: [AppColors.blueofgradient2, AppColors.bluebutton],
    center: Alignment.center,
    radius: 0.4,
    ),
    borderRadius: BorderRadius.zero,
    ),
    child: Column(
      children: [
        Expanded(child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 100),
            child:  Positioned(top:70,child:Image.asset('assets/images/failure.png')),),
            Align(
              alignment: Alignment.center,
              child:Column(children: [Text("Sorry", style: GoogleFonts.comicNeue(
                textStyle: const TextStyle(color: Colors.white, fontSize: 36,fontWeight: FontWeight.bold),
              ),),Text("Uh Oh",style: GoogleFonts.comicNeue(
                textStyle: const TextStyle(color: Colors.amber, fontSize: 36,fontWeight: FontWeight.bold),
              ),),
              Text("Sorry for what you didn't acheive ",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                 Text( "You've truely earned this moment of ",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                Text("celebration",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(width: 60,height: 60,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      boxShadow:const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],

                    ),
                    child: Center(child: Text("G",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.black,fontSize:24,fontWeight: FontWeight.bold)),)),
                    ),
                    Container(width: 60,height: 60,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,

                      boxShadow:const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                      child: Center(child: Text("O",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.black,fontSize:24,fontWeight: FontWeight.bold)),)),
                    ),

                    Container(width: 60,height: 60,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      boxShadow:const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                      child: Center(child: Text("O",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.black,fontSize:24,fontWeight: FontWeight.bold)),)),
                    ),  Container(width: 60,height: 60,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                        boxShadow:const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                    ),
                        child: Center(child: Text("D",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.black,fontSize:24,fontWeight: FontWeight.bold)),)),
                      ),


                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                  child: Center(child: Text("Luck in What's Next",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: Colors.white,fontSize:22,fontWeight: FontWeight.bold)),),),
                ),

                Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow:const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],

                  ),
                  child:
                      Center(child:
                      Text(
                          "Add More Courses",style:GoogleFonts.comicNeue(textStyle: const TextStyle(color: AppColors.bluebutton,fontSize:22,fontWeight: FontWeight.bold)),),




                      ))]

              ),
            )

          ],
        ))
      ],
    )
      ),
    ));
  }
  
}