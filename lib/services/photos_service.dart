import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/photos_model.dart';

class PhotosService {
  static const String url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<PhotosModel>> getPhotos() async {
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      List<dynamic>data = json.decode(response.body);

      return data.map((json)=> PhotosModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to upload photos");
    }
  }
}