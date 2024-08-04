import 'dart:convert';
import 'package:http/http.dart' as http;


import '../model/api_model.dart';

class HttpServices {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostsModel>> getPost() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
    List<dynamic> data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return data.map((e) => PostsModel.fromJson(e)).toList();
    }
    return [PostsModel(userId: 1, id: 1, title: "", body: "")];
  }

  static Future<String> createPost(PostsModel postsModel) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postsModel.toJson()),
    );

    if (response.statusCode == 201) {
      return 'Post created successfully';
    } else {
      return 'Failed to create post. Status code: ${response.statusCode}';
    }
  }


  static Future<String> updatePost(PostsModel postsModel) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${postsModel.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postsModel.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Post updated successfully';
    } else {
      return 'Failed to update post. Status code: ${response.statusCode}';
    }
  }

  static Future<String> patchPost(PostsModel postsModel) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/${postsModel.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(postsModel.toJson()),
    );

    if (response.statusCode == 200) {
      return 'Post updated successfully';
    } else {
      return 'Failed to update post. Status code: ${response.statusCode}';
    }
  }

  static Future<String> deletePost(int? id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return 'Post deleted successfully';
    } else {
      return 'Failed to delete post. Status code: ${response.statusCode}';
    }
  }
}