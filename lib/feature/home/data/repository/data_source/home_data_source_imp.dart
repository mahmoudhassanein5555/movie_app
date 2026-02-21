import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/data/api/home_api.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';
import 'package:movie_app/feature/home/domain/repository/data_source/home_data_source.dart';
import 'package:movie_app/feature/home/data/model/movie_dto.dart';

class HomeDataSourceImp implements HomeDataSource {
  final HomeApi _homeApi;
  HomeDataSourceImp(this._homeApi);

  @override
  Future<ApiResult<MoviesEntites>> getRecommendedMovies() async {
    final result = await _homeApi.getRecommendedMovies();
    switch (result) {
      case ApiSuccess<MoviesDto>():
        final moviesDto = result.data;
        final moviesEntity = moviesDto.toEntity();
        return ApiSuccess<MoviesEntites>(moviesEntity);
      case ApiError<MoviesDto>():
        return ApiError<MoviesEntites>(result.errorMessage);
    }
  }

  @override
  Future<ApiResult<MoviesEntites>> getPopularMovies() async {
    final result = await _homeApi.getPopularMovies();
    switch (result) {
      case ApiSuccess<MoviesDto>():
        final moviesDto = result.data;
        final moviesEntity = moviesDto.toEntity();
        return ApiSuccess<MoviesEntites>(moviesEntity);
      case ApiError<MoviesDto>():
        return ApiError<MoviesEntites>(result.errorMessage);
    }
  }

  @override
  Future<ApiResult<MoviesEntites>> getReleasesMovies() async {
    final result = await _homeApi.getReleasesMovies();
    switch (result) {
      case ApiSuccess<MoviesDto>():
        final moviesDto = result.data;
        final moviesEntites = moviesDto.toEntity();
        return ApiSuccess<MoviesEntites>(moviesEntites);
      case ApiError<MoviesDto>():
        return ApiError<MoviesEntites>(result.errorMessage);
    }
  }
}

HomeDataSource injectHomeDataSource() => HomeDataSourceImp(injectHomeApi());
