part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  SearchSuccess(this.results);
  final SearchResultsEntity results;
}

final class SearchError extends SearchState {
  SearchError(this.message);
  final String message;
}
