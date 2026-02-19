import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/feature/details/domain/entities/similar_movie_entity.dart';
import 'package:movie_app/feature/details/domain/repository/data_source/details_data_source.dart';
import 'package:movie_app/feature/details/domain/repository/repo/base_details_repo.dart';

class DetailsRepoImpl implements BaseDetailsRepository {
  final DetailsDataSource detailsDataSource;

  DetailsRepoImpl(this.detailsDataSource);

  @override
  Future<ApiResult<MovieDetailsEntity>> getMovieDetails(int movieId) async {
    try {
      final result = await detailsDataSource.getMovieDetails(movieId);
      return ApiSuccess(result);
    } catch (error) {
      return ApiError(error.toString());
    }
  }

  @override
  Future<ApiResult<List<SimilarMovieEntity>>> getSimilarMovies(
    int movieId,
  ) async {
    try {
      final result = await detailsDataSource.getSimilarMovies(movieId);
      return ApiSuccess(result);
    } catch (error) {
      return ApiError(error.toString());
    }
  }
}
