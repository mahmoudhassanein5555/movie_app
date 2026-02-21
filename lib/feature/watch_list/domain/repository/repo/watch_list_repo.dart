import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';

abstract class WatchListRepo {
  Future<List<WatchListEntity>> getWatchList();
  Future<void> addToWatchList(WatchListEntity movie);
  Future<void> removeFromWatchList(int movieId);
  Future<bool> isAdded(int movieId);
}
