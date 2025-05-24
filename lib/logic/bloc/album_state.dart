import '../../data/models/album_model.dart';

abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;

  AlbumLoaded({required this.albums});
}

class AlbumError extends AlbumState {
  final String message;

  AlbumError({required this.message});
}