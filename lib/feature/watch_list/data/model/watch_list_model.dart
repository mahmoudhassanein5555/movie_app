import 'package:hive/hive.dart';
import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';
part 'watch_list_model.g.dart';

@HiveType(typeId: 0)
class WatchListModel extends WatchListEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final String releaseDate;
  @HiveField(4)
  final double voteAverage;
  @HiveField(5)
  final String genre;
  @HiveField(6)
  final int runtime;

  WatchListModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genre,
    required this.runtime,
  }) : super(
         id: id,
         title: title,
         posterPath: posterPath,
         releaseDate: releaseDate,
         voteAverage: voteAverage,
         genre: genre,
         runtime: runtime,
       );
  factory WatchListModel.fromEntity(WatchListEntity entity) {
    return WatchListModel(
      id: entity.id,
      title: entity.title,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
      voteAverage: entity.voteAverage,
      genre: entity.genre,
      runtime: entity.runtime,
    );
  }
}
