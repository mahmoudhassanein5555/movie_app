import 'package:hive/hive.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';

import '../../../domain/repository/data_source/watch_list_data_source.dart';
import '../../model/watch_list_model.dart';

class WatchListDataSourceImp implements WatchListDataSource {
  final String _boxName = AppStrings.watchListBox;

  @override
  Future<List<WatchListEntity>> getWatchList() async {
    var box = await Hive.openBox<WatchListModel>(_boxName);
    return box.values.toList();
  }

  @override
  Future<void> addToWatchList(WatchListEntity movie) async {
    var box = await Hive.openBox<WatchListModel>(_boxName);
    await box.put(movie.id, WatchListModel.fromEntity(movie));
  }

  @override
  Future<void> removeFromWatchList(int movieId) async {
    var box = await Hive.openBox<WatchListModel>(_boxName);
    await box.delete(movieId);
  }

  @override
  Future<bool> isAdded(int movieId) async {
    var box = await Hive.openBox<WatchListModel>(_boxName);
    return box.containsKey(movieId);
  }
}
