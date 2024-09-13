import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnfast/constants/colors.dart';
import 'package:learnfast/controllers/register_controller.dart';

import 'package:learnfast/controllers/specialized_in.dart';
import 'package:learnfast/views/authentication/login.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});

  // ignore: unused_field
  final _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  YourController controller = Get.put(YourController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: 180,
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
                        'Create a free \n Account',
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
                          'assets/images/tutor1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      left: 50,
                      right: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(Login());
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(color: AppColors.bluebutton),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: buildSignUpForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSignUpForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.blue),
                    hintText: "Email...",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                    hintText: "Name...",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: roleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work, color: Colors.blue),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  hintText: "Role...",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Password...",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.bluebutton,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      registerController.register(
                          emailController.text,
                          nameController.text,
                          roleController.text,
                          passwordController.text);
                    }
                  },
                  child: Center(
                    child: Text(
                      'Register',
                      style: GoogleFonts.comicNeue(
                        textStyle: const TextStyle(
                            color: AppColors.whiteofgradeint,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
