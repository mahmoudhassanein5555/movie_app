import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/data/repository/repo/home_repo_imp.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';
import 'package:movie_app/feature/home/domain/repository/repo/home_repo.dart';

class GetRecommendedMoviesUseCase {
  HomeRepo _repo;
  GetRecommendedMoviesUseCase(this._repo);
  Future<ApiResult<MoviesEntites>> call() async =>
      await _repo.getRecommendedMovies();
}

GetRecommendedMoviesUseCase injectRecommendedMoviesUseCase() =>
    GetRecommendedMoviesUseCase(injectHomeRepo());
