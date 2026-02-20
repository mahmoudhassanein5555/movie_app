import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/data/model/movie_details_model.dart';
import 'package:movie_app/feature/details/data/model/similar_movie_model.dart';

abstract class DetailsDataSource {
  Future<ApiResult<MovieDetailsModel>> getMovieDetails(int movieId);
  Future<ApiResult<List<SimilarMovieModel>>> getSimilarMovies(int movieId);
}
