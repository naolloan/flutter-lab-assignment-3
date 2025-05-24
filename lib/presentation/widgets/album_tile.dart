import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/album_model.dart';

class AlbumTile extends StatelessWidget {
  final Album album;

  const AlbumTile({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(album.thumbnailUrl, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(album.title),
      onTap: () {
        context.go('/details', extra: album);
      },
    );
  }
}