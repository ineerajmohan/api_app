import 'package:api_app/models/photos_model.dart';
import 'package:api_app/services/photos_service.dart';
import 'package:flutter/material.dart';

class PhotosController extends ChangeNotifier {
  final PhotosService photosService = PhotosService();
  List<PhotosModel> Photos = [];
  bool isLoading = false;

  PhotosController(){
    getPhotos();
  }
  Future<void> getPhotos() async {
    isLoading = true;
    notifyListeners();

    try {
      Photos = await photosService.getPhotos();
    } catch(e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}