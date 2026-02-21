import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';

import '../repository/repo/watch_list_repo.dart';

class GetWatchListUseCase {
  final WatchListRepo repository;
  GetWatchListUseCase(this.repository);

  Future<List<WatchListEntity>> call() {
    return repository.getWatchList();
  }
}
