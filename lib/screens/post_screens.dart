import 'package:api_app/providers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';

class PostScreens extends StatelessWidget {
  const PostScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostController>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Posts"),),
        body: Padding(
        padding: const EdgeInsets.all(10),
    child: provider.isLoading
    ? const Center(child: CircularProgressIndicator(),)
        :ListView.builder(
    itemCount: provider.posts.length,
    itemBuilder: (context, index) {
    final post = provider.posts[index];
    return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    post.title ?? "No title",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    ),
    SizedBox(height: 10,),
    Text(
    post.body ?? "No body",
    style: TextStyle(fontSize: 14),
    ),

    SizedBox(height: 10,),
    Align(
    alignment: Alignment.centerRight,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    TextButton.icon(onPressed: (){
    _showDialog(context, post:post);
    } ,
    icon: Icon(Icons.edit),
    label: Text("Edit"),
    ),
    TextButton.icon(onPressed: () {
      if (post.id != null) {
        final idInt = int.tryParse(post.id!);
        if (idInt != null) {
          provider.deletePost(idInt);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid post id")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Cannot delete post without id")),
        );
      }
    },
    icon: Icon(Icons.delete),
    label: Text("Delete"),
    ),
    ],
    ),

    )
    ],
    ),
    );
    }
    ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: () {
    _showDialog(context);
    },
    child: Icon(Icons.add),),

    );
    }

    void _showDialog(BuildContext context, {PostModel? post}) {
    final titleController = TextEditingController(text: post?.title ?? '');
    final bodyController = TextEditingController(text: post?.body ?? '');
    final provider = Provider.of<PostController>(context, listen: false);

    showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
    return Padding(padding: EdgeInsets.all(10),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Text("Create Post"),
    SizedBox(height: 10,),
    TextField(
    controller: titleController,
    decoration: InputDecoration(labelText: "title"),
    ),
    SizedBox(height: 10,),
    TextField(
    controller: bodyController,
    decoration: InputDecoration(labelText: "body"),
    ),
    SizedBox(height: 20,),

    ElevatedButton(onPressed: () {
    final newOrUpdatedPost = PostModel(
    id: post?.id,
    title: titleController.text,
    body: bodyController.text,
    userId: post?.userId ?? "1",
    );

    if (post == null) {
    provider.addPost(newOrUpdatedPost);
    } else {
    provider.updatePost(newOrUpdatedPost);
    }

    Navigator.pop(context);

    }, child: Text((post == null ? "Add" : "Update"),
    ),
    ),
    ],
    ),
    );
    }
    );
    }
  }
