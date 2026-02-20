import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';

abstract class HomeDataSource {
  Future<ApiResult<MoviesEntites>> getRecommendedMovies();
  Future<ApiResult<MoviesEntites>> getPopularMovies();
  Future<ApiResult<MoviesEntites>> getReleasesMovies();
}
