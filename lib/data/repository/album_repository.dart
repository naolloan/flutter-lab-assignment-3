import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

class AlbumRepository {
  final http.Client client;

  AlbumRepository({required this.client});

  Future<List<Album>> getAlbumsWithPhoto() async {
    final albumsResponse = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final photosResponse = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (albumsResponse.statusCode == 200 && photosResponse.statusCode == 200) {
      final albumList = json.decode(albumsResponse.body) as List;
      final photoList = json.decode(photosResponse.body) as List;

      // Group first photo for each album
      final albumPhotos = <int, String>{};
      for (var photo in photoList) {
        int albumId = photo['albumId'];
        albumPhotos.putIfAbsent(albumId, () => photo['thumbnailUrl']);
      }

      return albumList.map((albumJson) {
        int id = albumJson['id'];
        return Album.fromJson(
          albumJson,
          thumbnailUrl: albumPhotos[id] ?? '',
        );
      }).toList();
    } else {
      throw Exception('Failed to load albums or photos');
    }
  }
}
