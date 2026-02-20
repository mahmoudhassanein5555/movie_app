import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/search/data/repository/data_source/search_data_source_imp.dart';
import 'package:movie_app/feature/search/domain/entites/serach_entities.dart';
import 'package:movie_app/feature/search/domain/repository/data_source/serach_data_source.dart';
import 'package:movie_app/feature/search/domain/repository/repo/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  SearchRepoImp(this._dataSource);
  final SearchDataSource _dataSource;

  @override
  Future<ApiResult<SearchResultsEntity>> search(String query) async {
    return await _dataSource.search(query);
  }
}

SearchRepo injectSearchRepo() => SearchRepoImp(injectSearchDataSource());
