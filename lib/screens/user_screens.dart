import 'package:api_app/providers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreens extends StatelessWidget {
  const UserScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserController>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              final user = provider.users[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name!),
                    const SizedBox(height: 10,),
                    Text(user.email!),
                    const SizedBox(height: 10,),
                    Text(user.address!.city!)
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
