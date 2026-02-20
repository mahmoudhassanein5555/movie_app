import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/domain/use_case/get_watch_list_use_case.dart';
import 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final GetWatchListUseCase getWatchListUseCase;
  WatchListCubit(this.getWatchListUseCase) : super(WatchListInitial());

  Future<void> getWatchList() async {
    emit(WatchListLoading());
    try {
      final result = await getWatchListUseCase.call();
      if (result.isEmpty) {
        emit(WatchListEmpty());
      } else {
        emit(WatchListSuccess(result));
      }
    } catch (e) {
      emit(WatchListError(AppStrings.errorTitle));
    }
  }

  Future<void> addToWatchList(WatchListEntity movie) async {
    try {
      await getWatchListUseCase.repository.addToWatchList(movie);
      getWatchList();
    } catch (e) {
      emit(WatchListError(AppStrings.errorTitleTwo));
    }
  }

  Future<void> removeFromWatchList(int movieId) async {
    try {
      await getWatchListUseCase.repository.removeFromWatchList(movieId);
      getWatchList();
    } catch (e) {
      emit(WatchListError(AppStrings.errorTitleTwo));
    }
  }

  Future<bool> isMovieSaved(int movieId) async {
    try {
      return await getWatchListUseCase.repository.isAdded(movieId);
    } catch (e) {
      return false;
    }
  }
}
