import 'package:movie_app/feature/details/domain/entities/similar_movie_entity.dart';

class SimilarMovieModel extends SimilarMovieEntity {
  const SimilarMovieModel({required super.id, super.posterPath, super.title});

  factory SimilarMovieModel.fromJson(Map<String, dynamic> json) {
    return SimilarMovieModel(
      id: json['id'],
      posterPath: json['poster_path'],
      title: json['title'],
    );
  }
}
