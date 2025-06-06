import 'package:api_app/models/user_model.dart';
import 'package:api_app/services/user_service.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  final UserService userService = UserService();
  List<UserModel> users = [];
  bool isLoading = false;

  UserController() {
    getUser();
  }

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();

    try {
      users = await userService.getUsers();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
