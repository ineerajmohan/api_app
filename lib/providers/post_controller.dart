import 'package:api_app/models/post_model.dart';
import 'package:flutter/material.dart';

import '../services/post_service.dart';

class PostController extends ChangeNotifier {
  final PostService postService = PostService();
  List<PostModel> posts = [];
  bool isLoading = false;

  PostController() {
    getPosts();
  }

  Future<void> getPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      posts = await postService.getPosts();
    } catch (e) {
      print("Error fetching post: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPost(PostModel post) async {
    isLoading = true;
    notifyListeners();

    try {
      final newPost = await postService.createPost(post);
      posts.insert(0, newPost);
      notifyListeners();
    } catch (e) {
      print("Error adding posts $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePost(PostModel updatePost) async {
    isLoading = true;
    notifyListeners();

    try {
      await postService.updatePost(updatePost);

      final index = posts.indexWhere((p) => p.id == updatePost.id);
      if (index != -1) {
        posts[index] = updatePost;
      }
    }
    catch (e) {
      print("Update error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deletePost(int id) async {
    isLoading = true;
    notifyListeners();

    try {
      await postService.deletePost(id);
      posts.removeWhere((post) => post.id == id);
    } catch(e) {
      print("Delete error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
