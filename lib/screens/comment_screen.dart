import 'package:api_app/providers/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentsState();
}

class _CommentsState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CommentController>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: provider.Comments.length,
            itemBuilder: (context, index) {
              final comments = provider.Comments[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(comments.id!.toString()),
                    SizedBox(height: 10,),
                    Text(comments.postId!.toString()),
                    SizedBox(height: 10,),
                    Text(comments.name!.toString()),
                    SizedBox(height: 10,),
                    Text(comments.body!.toString()),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
