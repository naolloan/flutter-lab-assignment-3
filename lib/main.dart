import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'data/repository/album_repository.dart';
import 'logic/bloc/album_bloc.dart';
import 'logic/bloc/album_event.dart';
import 'router/app_router.dart';

void main() {
  final httpClient = http.Client();
  final albumRepository = AlbumRepository(client: httpClient);
  runApp(MyApp(repository: albumRepository));
}

class MyApp extends StatelessWidget {
  final AlbumRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(repository: repository)..add(FetchAlbums()),
      child: Builder(
        builder: (context) {
          final router = createRouter();
          return MaterialApp.router(
            routerConfig: router,
            title: 'Album App',
            theme: ThemeData(primarySwatch: Colors.blue),
          );
        },
      ),
    );
  }
}
