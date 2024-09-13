import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/controllers/reset_password.dart';
import 'package:learnfast/views/allprofile/update_password.dart';

import '../../constants/colors.dart';
import '../authentication/login.dart';



// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController roleController = TextEditingController();
PasswordResetController resetPassword=Get.put(PasswordResetController());
   ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        
        child:

      Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(leading:GestureDetector(
            onTap: (){
              Get.to(Login());
            },
            child: const Icon(Icons.arrow_back,
          ),),),
          body:Column(
      //  mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Align(
               alignment: Alignment.center,
                child: Container(
                  width: 350,
                  height: 190,
                  margin:const EdgeInsets.symmetric(vertical:20,horizontal: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: const RadialGradient(
                      colors: [AppColors.coursewidget, AppColors.blueofgradient2],
                      center: Alignment.center,
                      radius: 0.7,
                    ),
                    borderRadius:BorderRadius.circular(10.0),
                  ),
                  child: Stack(children: [

                    Positioned(
                      right:0,
                      top: 45,
                      child: SizedBox(
                        width: 210,
                        height: 172,
                        child: Image.asset("assets/images/datasecurity.png"),
                        ),
                      ),

                   Positioned(
                      left: 25,
                      top: 25,
                      child: Text(
                        'Reset Your \nPassword\nHere'.tr,
                        style: GoogleFonts.comicNeue(
color:AppColors.whiteofgradeint,
                          textStyle: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                        ),


                      ),
                    ),
                  ],),
                ),
              ),
 Text("Tap the otp you have received on your email !".tr,

   style: GoogleFonts.comicNeue(
       color:AppColors.bluebutton,
       textStyle: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.w800)
   ),),
Padding(padding:
const EdgeInsets.all(40.0),child:
Form(
    key: _formKey,
    child: Column(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child:
    TextFormField(
    controller: emailController,
      style: const TextStyle(fontSize: 8.0), // Adjust font size here
              decoration: InputDecoration(
                labelText: 'Email'.tr,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email,color: Colors.blue,),
              ),

               
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter an email';
    }
    return null;
    },
    ),),
   
      Transform.scale(
        scaleX: 1.5,
        scaleY: 0.9,
        child:
        PhysicalModel(
          color: AppColors.bluebutton,
          elevation: 8,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(2),
          child: Transform.scale(
            scaleX: 0.5,
            scaleY: 0.8,

            child: InkWell(
              onTap: ()async {
                if (_formKey.currentState!.validate()) {
resetPassword.resetPassword(emailController.text);
  Get.to(UpdatePassword()); // Navigate to UpdatePassword screen              //    loginController.signin(emailController.text, passwordController.text,roleController.text);
                }
              },

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Continue',
                  style: GoogleFonts.comicNeue(
                    textStyle: const TextStyle(color: AppColors.whiteofgradeint, fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
          ),
       ),
)])));
  }
}