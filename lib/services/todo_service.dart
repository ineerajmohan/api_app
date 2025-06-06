import 'dart:convert';

import 'package:api_app/models/post_model.dart';
import 'package:api_app/models/todo_model.dart';
import 'package:http/http.dart' as http;


class TodoService {
  static const String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic>data = json.decode(response.body);

      return data.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception("Data is not loading");
    }
  }
}