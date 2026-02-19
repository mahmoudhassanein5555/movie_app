import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/data/model/movie_dto.dart';

class HomeApi {
  Future<ApiResult<MoviesDto>> getRecommendedMovies() async {
    try {
      Uri url = Uri.https(
        MoviesApiConstants.baseUrl,
        MoviesApiConstants.topRatedMoviesPath,
        {"api_key": MoviesApiConstants.apiKey},
      );
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      MoviesDto moviesApiModel = MoviesDto.fromJson(json);
      return ApiSuccess<MoviesDto>(moviesApiModel);
    } catch (e) {
      return ApiError<MoviesDto>(e.toString());
    }
  }

  Future<ApiResult<MoviesDto>> getPopularMovies() async {
    try {
      Uri url = Uri.https(
        MoviesApiConstants.baseUrl,
        MoviesApiConstants.popularMoviesPath,
        {"api_key": MoviesApiConstants.apiKey},
      );
      var response = await http.get(url);
      var responseString = response.body;
      var json = jsonDecode(responseString);
      MoviesDto moviesApiModel = MoviesDto.fromJson(json);
      return ApiSuccess<MoviesDto>(moviesApiModel);
    } catch (e) {
      return ApiError<MoviesDto>(e.toString());
    }
  }

  Future<ApiResult<MoviesDto>> getReleasesMovies() async {
    try {
      Uri url = Uri.https(
        MoviesApiConstants.baseUrl,
        MoviesApiConstants.upcomingMoviesPath,
        {"api_key": MoviesApiConstants.apiKey},
      );
      var response = await http.get(url);
      var reponseString = response.body;
      var json = jsonDecode(reponseString);
      MoviesDto moviesApiModel = MoviesDto.fromJson(json);
      return ApiSuccess<MoviesDto>(moviesApiModel);
    } catch (e) {
      return ApiError<MoviesDto>(e.toString());
    }
  }
}

HomeApi injectHomeApi() => HomeApi();
