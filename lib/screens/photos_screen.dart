import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/photos_controller.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PhotosController>(context);
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: controller.Photos.length,
            itemBuilder: (context, index) {
              final photo = controller.Photos[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: ListTile(
                  leading: Image.network(
                    photo.thumbnailUrl ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(photo.title ?? "No Title"),
                  subtitle: Text("ID: ${photo.id}"),
                ),
              );
    },
    ),
    ));
  }
}
