import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learnfast/controllers/login.dart';

class UserController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  Future<String?> gettoken() {
    return loginController.gettoken();
  }

  List<String> users = [];
  var currentPage = 1;
  final String cacheKey = 'userCache';
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
   
    scrollController.addListener(scrollListener);
  }

  @override
  void onClose() {

    scrollController.removeListener(scrollListener);
    super.onClose();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoading) {
    
      fetchUsers(page: currentPage + 1);
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final response =
          await http.delete(Uri.parse('http://127.0.0.1:5000/users/$userId'));

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }

  Future<List<dynamic>> fetchUsers(
      {int page = 1, int perPage = 10}) async {
    if (isLoading) return [];
    isLoading = true;
    Dio dio = Dio();
    try {
      String? token = await gettoken();

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.headers['Content-Type'] = 'application/json';

      final response = await dio.get(
        'http://192.168.1.13:5000/users',
        queryParameters: {'page': page, 'per_page': perPage},
      );

      if (response.statusCode == 200) {
        List<dynamic> newData = response.data;
        
        users.addAll(newData[0]);
        currentPage = page;
        return users;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    } finally {
      isLoading = false;
    }
  }
}
