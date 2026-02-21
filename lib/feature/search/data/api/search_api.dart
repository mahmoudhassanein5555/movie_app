import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/feature/search/data/model/search_result_dto.dart';

class SearchApi {
  Future<ApiResult<SearchResultsDto>> searchResults(String query) async {
    try {
      Uri url = Uri.https(
        MoviesApiConstants.baseUrl,
        MoviesApiConstants.searchMoviesPath,
        {'api_key': MoviesApiConstants.apiKey, 'query': query},
      );
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiSuccess<SearchResultsDto>(SearchResultsDto.fromJson(json));
      } else {
        return ApiError<SearchResultsDto>(AppStrings.failedToLoadMovies);
      }
    } catch (e) {
      return ApiError<SearchResultsDto>(e.toString());
    }
  }
}

SearchApi injectSearchApi() => SearchApi();
