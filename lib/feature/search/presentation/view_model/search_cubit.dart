import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/search/domain/entites/serach_entities.dart';
import 'package:movie_app/feature/search/domain/use_case/search_use_case.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchUseCase) : super(SearchInitial());
  final SearchUseCase _searchUseCase;

  Timer? _debounce;

  void intent(SearchIntent event) {
    if (event is SearchIntentEvent) {
      _getSearchResults(event);
    }
  }

  void _getSearchResults(SearchIntentEvent event) {
    _debounce?.cancel();
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());

      final result = await _searchUseCase.invoke(event.query);

      if (isClosed) return;

      switch (result) {
        case ApiSuccess<SearchResultsEntity>():
          emit(SearchSuccess(result.data));
        case ApiError<SearchResultsEntity>():
          emit(SearchError(result.errorMessage));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

sealed class SearchIntent {}

class SearchIntentEvent extends SearchIntent {
  SearchIntentEvent(this.query);
  final String query;
}
