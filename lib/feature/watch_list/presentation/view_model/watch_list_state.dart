import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';

abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListEmpty extends WatchListState {}

class WatchListSuccess extends WatchListState {
  final List<WatchListEntity> movies;
  WatchListSuccess(this.movies);
}

class WatchListError extends WatchListState {
  final String message;
  WatchListError(this.message);
}
