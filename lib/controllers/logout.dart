import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learnfast/views/authentication/login.dart';

class AuthController extends GetxController {
  final storage = const FlutterSecureStorage();

  Future<void> logout() async {
    await storage.delete(key: 'token');
  Get.to(Login());
  }
}
