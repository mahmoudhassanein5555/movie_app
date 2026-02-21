import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/feature/details/domain/entities/similar_movie_entity.dart';

abstract class BaseDetailsRepository {
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId);

  Future<ApiResult<List<SimilarMovieEntity>>> getSimilarMovies(int movieId);
}
