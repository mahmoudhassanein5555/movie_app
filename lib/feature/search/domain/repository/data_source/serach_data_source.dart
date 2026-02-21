import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/search/domain/entites/serach_entities.dart';

abstract class SearchDataSource {
  Future<ApiResult<SearchResultsEntity>> search(String query);
}