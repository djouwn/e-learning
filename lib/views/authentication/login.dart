import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:learnfast/controllers/login.dart';
import 'package:learnfast/views/allprofile/reset.dart';
import 'package:learnfast/views/authentication/signup.dart';

import '../../constants/colors.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
LoginController loginController=Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
final TextEditingController emailController=TextEditingController();
final TextEditingController passwordController=TextEditingController();
  final TextEditingController roleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:
          Column(children:[
            SizedBox(
          width: double.infinity,
          height: 200,
          child:
           Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: const RadialGradient(
                    colors: [AppColors.coursewidget, AppColors.blueofgradient2],
                    center: Alignment.center,
                    radius: 0.7,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(180.0),
                    bottomRight: Radius.circular(180.0),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  height: 350,
                ),
              ),
              Positioned(
             left:0,right:0,top: 0,bottom: 0,
                child: Image.asset("assets/images/books.png"),
              ),]),),
              Positioned(
             
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Login Here',
                        style: GoogleFonts.comicNeue(
                          textStyle: const TextStyle(color: AppColors.bluebutton, fontSize: 27,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),


          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                const Text(
                   "Don't have an account ? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                 onTap: (){
                   Get.to(SignUp());
                 },
                  child:
                const Text(
                   "Sign Up",
                  style: TextStyle(color: AppColors.bluebutton),



                ))]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child:
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                           Padding(
                      padding: const EdgeInsets.all( 5.0),
                      child:
                                   TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      hintText: "Email...",
                      contentPadding:   EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
                     
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
                      contentPadding:   const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
                     ,
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

                      hintText: "Password...",
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
                    decoration: const InputDecoration(
                      contentPadding:   EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)
                     ,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      hintText: "Role...",
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

                                   loginController.signin(emailController.text, passwordController.text,roleController.text);
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
                         Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(ResetPassword());
                                },
                                child:
                              const Text(
                                "Reset Password",
                                style: TextStyle(color: AppColors.bluebutton),
                              ),),
                            ],
                          ),

                       ],
                      ),
                    ),
                 ) ],
                ),
              ),
            
          ]),
        ),
      ));
  }
}


