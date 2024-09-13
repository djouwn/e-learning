import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/reset_password.dart';

class PasswordResetScreen extends StatelessWidget {
  final PasswordResetController controller = Get.put(PasswordResetController());
  final TextEditingController _emailController = TextEditingController();

  PasswordResetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Reset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:() {controller.resetPassword(_emailController.text);},
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}