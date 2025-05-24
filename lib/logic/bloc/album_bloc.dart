import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/album_repository.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.getAlbumsWithPhoto();
        emit(AlbumLoaded(albums: albums));
      } catch (e) {
        emit(AlbumError(message: e.toString()));
      }
    });
  }
}