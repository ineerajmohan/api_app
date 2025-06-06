import 'package:api_app/models/comment_model.dart';
import 'package:api_app/services/comment_service.dart';
import 'package:flutter/cupertino.dart';

class CommentController extends ChangeNotifier {
  final CommentService commentService = CommentService();
  List<CommentModel> Comments = [];
  bool isLoading = false;

  CommentController() {
    getComments();
  }

  Future<void> getComments() async {
    isLoading = true;
    notifyListeners();

    try {
      Comments = await commentService.getComment();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
