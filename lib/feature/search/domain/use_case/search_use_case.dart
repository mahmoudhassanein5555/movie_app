import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/search/data/repository/repo/search_repo_imp.dart';
import 'package:movie_app/feature/search/domain/entites/serach_entities.dart';
import 'package:movie_app/feature/search/domain/repository/repo/search_repo.dart';

class SearchUseCase {
  SearchUseCase(this._repo);
  final SearchRepo _repo;

  Future<ApiResult<SearchResultsEntity>> invoke(String query) =>
      _repo.search(query);
}

SearchUseCase injectSearchUseCase() => SearchUseCase(injectSearchRepo());
