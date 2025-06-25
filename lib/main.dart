import 'package:api_app/models/user_model.dart';
import 'package:api_app/providers/comment_controller.dart';
import 'package:api_app/providers/photos_controller.dart';
import 'package:api_app/providers/post_controller.dart';
import 'package:api_app/providers/todo_contoller.dart';
import 'package:api_app/providers/user_controller.dart';

import 'package:api_app/screens/comment_screen.dart';
import 'package:api_app/screens/photos_screen.dart';
import 'package:api_app/screens/post_screens.dart';
import 'package:api_app/screens/todo_screen.dart';

import 'package:api_app/screens/user_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostController()),
        ChangeNotifierProvider(create: (context) => CommentController()),
        ChangeNotifierProvider(create: (context) => TodoController()),
        ChangeNotifierProvider(create: (context)=> UserController()),
        ChangeNotifierProvider(create: (context)=> PhotosController()),
      ],
      child: MaterialApp(
        title: "Flutter demo",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
        ),
      home: PhotosScreen(),
      ),
    );
  }
}
