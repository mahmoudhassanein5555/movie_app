class WatchListEntity {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  final String genre;
  final int runtime;

  WatchListEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genre,
    required this.runtime,
  });
}
