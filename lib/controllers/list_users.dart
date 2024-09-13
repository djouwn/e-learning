import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:learnfast/test/models/users.dart';

class UserController extends GetxController {
  RxList<User> users = <User>[].obs;
  final box = GetStorage();
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      if (box.read('cachedUsers') != null) {
        // Retrieve cached users if available
        users.addAll((box.read('cachedUsers') as List<dynamic>)
            .map((user) => User(name: user[0], email: user[1]))
            .toList());
      }
      if (users.isEmpty) {
        // If no cached users, set isLoading to true to display loading indicator
        isLoading = true;
      }
      const url = 'http://192.168.1.13:5000/users';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        responseData.forEach((key, value) {
          value.forEach((user) {
            users.add(User(name: user[0], email: user[1]));
          });
        });
        // Cache the fetched users
        box.write('cachedUsers', responseData);
        isLoading = false; // Set isLoading to false after data is loaded
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final response = await http.delete(Uri.parse('http://192.168.1.13:5000/users/$userId'));
      if (response.statusCode == 200) {
        // Do something after deleting user
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }
}
