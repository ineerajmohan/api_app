import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_app/models/user_model.dart';

class UserService {
  static const String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic>data = json.decode(response.body);

      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
