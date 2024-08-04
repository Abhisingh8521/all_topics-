import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostApiScreens extends StatefulWidget {
  const PostApiScreens({Key? key}) : super(key: key);

  @override
  State<PostApiScreens> createState() => _PostApiScreensState();
}

class _PostApiScreensState extends State<PostApiScreens> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<void> postData() async {
    final response = await http.post(
      Uri.parse('https://your-api-url.com/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': titleController.text,
        'body': bodyController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Post successful!');
    } else {
      throw Exception('Failed to post data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: 'Body',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                postData();
              },
              child: const Text('Add Post'),
            ),
          ],
        ),
      ),
    );
  }
}
