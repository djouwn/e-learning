import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/controllers/reset_password.dart';
import 'package:learnfast/controllers/update_password_controller.dart';
import 'package:learnfast/views/allprofile/update_password.dart';
import 'dart:convert';
import '../../constants/colors.dart';
import '../authentication/login.dart';
import 'package:http/http.dart' as http;
class OTPController extends GetxController {
  Future<void> verifyOTP(String email, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.13:5000/verify-otp'),
         headers: <String, String>{
        'Content-Type': 'application/json',
      },
        body:jsonEncode( {"email": email, "otp": otp}) // Pass JSON data directly
      );

      if (response.statusCode == 200) {
        // If OTP verification is successful
        Get.snackbar('Success', 'OTP verification successful');
      
      } else if (response.statusCode == 401) {
        // If OTP verification fails
        Get.snackbar('Error', 'Invalid OTP or OTP expired');
      } else {
        // Handle other status codes
        Get.snackbar('Error', 'Failed to verify OTP');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error: $e');
      }
      Get.snackbar('Error', 'Failed to verify OTP');
    }
  }

}

// ignore: must_be_immutable
class VerifyOtp extends StatelessWidget {
  PasswordUpdateController updateController=Get.put(PasswordUpdateController());
  OTPController opt=Get.put(OTPController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController roleController = TextEditingController();
PasswordResetController resetPassword=Get.put(PasswordResetController());
 VerifyOtp ({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child:

      Scaffold(
         
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
    padding: const EdgeInsets.all( 5.0),
    child:
    TextFormField(
    controller: emailController,
    decoration: InputDecoration(
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.email, color: Colors.blue),
    hintText: "Email...".tr,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter an email';
    }
    return null;
    },
    ),),
    Padding(
    padding: const EdgeInsets.all(5.0),
    child:
    TextFormField(
    controller: passwordController,
    obscureText: false,
    decoration: InputDecoration(
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
    suffixIcon: IconButton(
    onPressed: () {
    //   _controller.togglePasswordVisibility();
    },
    icon:  const Icon(

    Icons.visibility,

    color: Colors.grey,
    )),

    hintText: "Otp...".tr,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter a password';
    }
    return null;
    },
    ),),
    Padding(
    padding: const EdgeInsets.all( 5.0),
    child:
    TextFormField(
    controller: roleController,
    decoration:  InputDecoration(
    border: const OutlineInputBorder(),
    prefixIcon: const Icon(Icons.email, color: Colors.blue),
    hintText: "Role...".tr,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter the role you registered with';
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
opt.verifyOTP(emailController.text, passwordController.text)   ;         //    loginController.signin(emailController.text, passwordController.text,roleController.text);
                }
              },

              child: Padding(
                padding: const EdgeInsets.all(5.0),
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