import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnfast/controllers/chatbot_api.dart';




class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookSearchScreenState createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  final BookService _bookService = Get.put(BookService());
  String _searchTerm = '';
  String _response = '';

  Future<void> _searchBooks() async {
    try {
      final Map<String, dynamic> response = await _bookService.getBooks(_searchTerm);
      setState(() {
        _response = response.toString();
      });
    } catch (error) {
      setState(() {
        _response = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Search'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _searchTerm = value;
            },
            onSubmitted: (_) {
              _searchBooks();
            },
            decoration: InputDecoration(
              hintText: 'Enter search term',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: _searchBooks,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _response,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
