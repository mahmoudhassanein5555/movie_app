import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';
import 'package:movie_app/feature/home/domain/use_case/popular_movies_use_case.dart';
import 'package:movie_app/feature/home/presentation/view_model/home_state.dart';

class PopularCubit extends Cubit<HomeState> {
  PopularCubit(this._getPopularMoviesUseCase) : super(HomeInitial());
  GetPopularMoviesUseCase _getPopularMoviesUseCase;
  Future<void> intent(HomeIntent intent) async {
    if (intent is PopularMoviesIntent) {
      await _getPopularMovies();
    }
  }

  Future<void> _getPopularMovies() async {
    emit(HomeLoading());
    final result = await _getPopularMoviesUseCase.call();
    if (result is ApiSuccess<MoviesEntites>) {
      final recommendedMovies = result.data.results ?? [];
      emit(HomeSuccess(recommendedMovies));
    } else if (result is ApiError<MoviesEntites>) {
      emit(HomeError(result.errorMessage));
    }
  }
}

sealed class HomeIntent {}

class PopularMoviesIntent extends HomeIntent {}
