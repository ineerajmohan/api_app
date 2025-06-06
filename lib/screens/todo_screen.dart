import 'package:api_app/providers/todo_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoController>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: provider.Todos.length,
            itemBuilder: (context, index) {
              final Todos = provider.Todos[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Todos.id!.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Todos.userId!.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Todos.title!.toString()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(Todos.completed!.toString()),
                  ],
                ),
              );
            }),
      ),
    );
  }
}