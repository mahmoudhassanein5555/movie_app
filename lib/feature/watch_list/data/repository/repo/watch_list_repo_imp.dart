import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';
import '../../../domain/repository/data_source/watch_list_data_source.dart';
import '../../../domain/repository/repo/watch_list_repo.dart';

class WatchListRepoImp implements WatchListRepo {
  final WatchListDataSource dataSource;
  WatchListRepoImp(this.dataSource);

  @override
  Future<List<WatchListEntity>> getWatchList() {
    return dataSource.getWatchList();
  }

  @override
  Future<void> addToWatchList(WatchListEntity movie) {
    return dataSource.addToWatchList(movie);
  }

  @override
  Future<void> removeFromWatchList(int movieId) {
    return dataSource.removeFromWatchList(movieId);
  }

  @override
  Future<bool> isAdded(int movieId) {
    return dataSource.isAdded(movieId);
  }
}
