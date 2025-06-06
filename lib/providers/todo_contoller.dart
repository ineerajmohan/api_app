import 'package:api_app/models/todo_model.dart';
import 'package:api_app/services/todo_service.dart';
import 'package:flutter/material.dart';

class TodoController extends ChangeNotifier {
  final TodoService todoService = TodoService();
  List<TodoModel> Todos = [];
  bool isLoading = false;

  TodoController() {
    getTodo();
  }
  Future<void> getTodo() async {
    isLoading = true;
    notifyListeners();

    try {
      Todos = await todoService.getTodos();
    } catch(e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}