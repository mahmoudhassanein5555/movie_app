import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/data/api/details_api.dart';
import 'package:movie_app/feature/details/data/model/movie_details_model.dart';
import 'package:movie_app/feature/details/data/model/similar_movie_model.dart';
import 'package:movie_app/feature/details/domain/repository/data_source/details_data_source.dart';

class DetailsDataSourceImpl implements DetailsDataSource {
  final DetailsApi detailsApi;

  DetailsDataSourceImpl({required this.detailsApi});

  @override
  Future<ApiResult<MovieDetailsModel>> getMovieDetails(int movieId) async {
    try {
      final jsonMap = await detailsApi.getMovieDetails(movieId);
      return ApiSuccess(MovieDetailsModel.fromJson(jsonMap));
    } catch (error) {
      return ApiError(error.toString());
    }
  }

  @override
  Future<ApiResult<List<SimilarMovieModel>>> getSimilarMovies(
    int movieId,
  ) async {
    try {
      final similarMoviesList = await detailsApi.getSimilarMovies(movieId);
      return ApiSuccess(similarMoviesList);
    } catch (error) {
      return ApiError(error.toString());
    }
  }
}
