import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/search/data/api/search_api.dart';
import 'package:movie_app/feature/search/data/model/search_result_dto.dart';
import 'package:movie_app/feature/search/domain/entites/serach_entities.dart';
import 'package:movie_app/feature/search/domain/repository/data_source/serach_data_source.dart';

class SearchDataSourceImp implements SearchDataSource {
  SearchDataSourceImp(this._api);
  final SearchApi _api;
  @override
  Future<ApiResult<SearchResultsEntity>> search(String query) async {
    var result = await _api.searchResults(query);
    switch (result) {
      case ApiSuccess<SearchResultsDto>():
        return ApiSuccess<SearchResultsEntity>(result.data.toEntity());
      case ApiError<SearchResultsDto>():
        return ApiError<SearchResultsEntity>(result.errorMessage);
    }
  }
}

SearchDataSource injectSearchDataSource() =>
    SearchDataSourceImp(injectSearchApi());
