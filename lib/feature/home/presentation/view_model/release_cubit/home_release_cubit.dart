import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';
import 'package:movie_app/feature/home/domain/use_case/releases_movies_use_case.dart';
import 'package:movie_app/feature/home/presentation/view_model/home_state.dart';


class ReleasesCubit extends Cubit<HomeState> {
  ReleasesCubit(this._getReleasesMoviesUseCase) : super(HomeInitial());
  final GetReleasesMoviesUseCase _getReleasesMoviesUseCase;
  Future<void> intent(HomeIntent intent) async {
    if (intent is ReleasesMoviesIntent) {
      await _getReleasesMovies();
    }
  }

  Future<void> _getReleasesMovies() async {
    emit(HomeLoading());
    final result = await _getReleasesMoviesUseCase.call();
    if (result is ApiSuccess<MoviesEntites>) {
      final releasesMovies = result.data.results ?? [];
      emit(HomeSuccess(releasesMovies));
    } else if (result is ApiError<MoviesEntites>) {
      emit(HomeError(result.errorMessage));
    }
  }
}

sealed class HomeIntent {}

class ReleasesMoviesIntent extends HomeIntent {}
