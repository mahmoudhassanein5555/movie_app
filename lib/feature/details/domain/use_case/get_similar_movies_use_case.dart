import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entities/similar_movie_entity.dart';
import 'package:movie_app/feature/details/domain/repository/repo/base_details_repo.dart';

class GetSimilarMoviesUseCase {
  final BaseDetailsRepository baseDetailsRepository;

  GetSimilarMoviesUseCase(this.baseDetailsRepository);

  Future<ApiResult<List<SimilarMovieEntity>>> call(int movieId) async {
    return await baseDetailsRepository.getSimilarMovies(movieId);
  }
}
