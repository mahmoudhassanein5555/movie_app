import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_constant.dart';

class DetailsApi {
  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final uri = Uri.https(
      MoviesApiConstants.baseUrl,
      "${MoviesApiConstants.movieDetailsPath}/$movieId",
      {"api_key": MoviesApiConstants.apiKey},
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load movie details");
    }
  }

  Future<List<dynamic>> getSimilarMovies(int movieId) async {
    final uri = Uri.https(
      MoviesApiConstants.baseUrl,
      "${MoviesApiConstants.movieDetailsPath}/$movieId/similar",
      {"api_key": MoviesApiConstants.apiKey},
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data["results"];
    } else {
      throw Exception("Failed to load similar movies");
    }
  }
}
