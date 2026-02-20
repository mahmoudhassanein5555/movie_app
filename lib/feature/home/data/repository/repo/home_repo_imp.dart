import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/data/repository/data_source/home_data_source_imp.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';
import 'package:movie_app/feature/home/domain/repository/data_source/home_data_source.dart';
import 'package:movie_app/feature/home/domain/repository/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final HomeDataSource _homeDataSource;
  HomeRepoImp(this._homeDataSource);
  @override
  Future<ApiResult<MoviesEntites>> getRecommendedMovies() =>
      _homeDataSource.getRecommendedMovies();

  @override
  Future<ApiResult<MoviesEntites>> getPopularMovies() =>
      _homeDataSource.getPopularMovies();

  @override
  Future<ApiResult<MoviesEntites>> getReleasesMovies() =>
      _homeDataSource.getReleasesMovies();
}

HomeRepo injectHomeRepo() => HomeRepoImp(injectHomeDataSource());
