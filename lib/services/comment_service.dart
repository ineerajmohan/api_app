import 'dart:convert';

import 'package:api_app/screens/comment_screen.dart';
import 'package:http/http.dart' as http;

import '../models/comment_model.dart';

class CommentService {
  static const String url = "https://jsonplaceholder.typicode.com/comments";

  Future<List<CommentModel>> getComment() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
  List<dynamic>data = json.decode(response.body);

  return data.map((json) => CommentModel.fromJson(json)).toList();
    } else {
  throw Exception("Failed to load data");
    }
  }
}