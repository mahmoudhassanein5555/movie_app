import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/feature/details/domain/repository/repo/base_details_repo.dart';

class GetMovieDetailsUseCase {
  final BaseDetailsRepository baseDetailsRepository;

  GetMovieDetailsUseCase(this.baseDetailsRepository);

  Future<ApiResult<MovieDetailsEntity>> call(int movieId) async {
    return await baseDetailsRepository.getMovieDetails(movieId);
  }
}
