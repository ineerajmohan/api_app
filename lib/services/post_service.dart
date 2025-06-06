import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_app/models/post_model.dart';

class PostService {
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception(
          "Failed to load data. Status Code: ${response.statusCode}");
    }
  }

  Future<PostModel> createPost(PostModel post) async {
    final response = await http.post(Uri.parse(url),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );
    if (response.statusCode == 201) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create post");
    }
  }

  Future<PostModel> updatePost(PostModel post) async {
    final response = await http.put(Uri.parse("$url/${post.id}"),

    headers: {
    'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 200) {
    return PostModel.fromJson(jsonDecode(response.body));
    } else {
    throw Exception("Failed to update post");
    }
  }

  Future<void> deletePost(int id ) async {
final response = await http.delete(Uri.parse("$url/$id"));

if (response.statusCode !=200) {
  throw Exception("Failed to delete post");
}
  }
}
