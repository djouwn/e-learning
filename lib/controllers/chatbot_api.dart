import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BookService extends GetxController{
  final String _apiUrl = 'https://getbooksinfo.p.rapidapi.com/';
  final Map<String, String> _headers = {
    'X-RapidAPI-Key': '521a9f342fmsh29787be2c6c724ep1cea45jsn4c6ba1f8e9b1',
    'X-RapidAPI-Host': 'getbooksinfo.p.rapidapi.com'
  };

  Future<Map<String, dynamic>> getBooks(String searchTerm) async {
    final Map<String, String> queryParams = {'s': searchTerm};

    try {
      final response = await http.get(
        Uri.parse('$_apiUrl?${Uri(queryParameters: queryParams).query}'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
