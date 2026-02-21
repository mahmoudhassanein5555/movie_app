import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_result.dart';
import 'package:movie_app/feature/home/domain/entites/movies_entites.dart';
import 'package:movie_app/feature/home/domain/use_case/recommended_movies_use_case.dart';
import 'package:movie_app/feature/home/presentation/view_model/home_state.dart';

class RecommendedCubit extends Cubit<HomeState> {
  RecommendedCubit(this._getRecommendedMoviesUseCase) : super(HomeInitial());
  GetRecommendedMoviesUseCase _getRecommendedMoviesUseCase;
  Future<void> intent(HomeIntent intent) async {
    if (intent is RecommendedMoviesIntent) {
      await _getRecommendedMovies();
    }
  }

  Future<void> _getRecommendedMovies() async {
    emit(HomeLoading());
    final result = await _getRecommendedMoviesUseCase.call();
    if (result is ApiSuccess<MoviesEntites>) {
      final recommendedMovies = result.data.results ?? [];
      emit(HomeSuccess(recommendedMovies));
    } else if (result is ApiError<MoviesEntites>) {
      emit(HomeError(result.errorMessage));
    }
  }
  
}

sealed class HomeIntent {}

class RecommendedMoviesIntent extends HomeIntent {}
