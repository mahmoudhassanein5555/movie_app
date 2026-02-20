import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/feature/details/data/model/similar_movie_model.dart';

class DetailsApi {
  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    try {
      final uri = Uri.https(
        MoviesApiConstants.baseUrl,
        "${MoviesApiConstants.movieDetailsPath}/$movieId",
        {"api_key": MoviesApiConstants.apiKey},
      );

      final response = await http.get(uri);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        throw Exception(AppStrings.failedToLoadMovieDetails);
      }
    } catch (e) {
      throw Exception("${AppStrings.networkErrorOccurred} :$e");
    }
  }

  Future<List<SimilarMovieModel>> getSimilarMovies(int movieId) async {
    try {
      final uri = Uri.https(
        MoviesApiConstants.baseUrl,
        "${MoviesApiConstants.movieDetailsPath}/$movieId/similar",
        {"api_key": MoviesApiConstants.apiKey},
      );

      final response = await http.get(uri);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        final List results = data["results"] ?? [];

        return results
            .map((movie) => SimilarMovieModel.fromJson(movie))
            .toList();
      } else {
        throw Exception(AppStrings.failedToLoadSimilarMovies);
      }
    } catch (e) {
      throw Exception("${AppStrings.networkErrorOccurred} :$e");
    }
  }
}
