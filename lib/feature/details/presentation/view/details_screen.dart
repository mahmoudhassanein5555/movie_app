import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';
import 'package:movie_app/feature/details/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:movie_app/feature/details/presentation/widgets/movie_banner_custom_widget.dart';
import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/watch_list_cubit.dart';
import '../../data/api/details_api.dart';
import '../../data/repository/data_source/details_data_source_imp.dart';
import '../../data/repository/repo/details_repo_imp.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../../domain/use_case/get_similar_movies_use_case.dart';
import '../view_model/details_cubit.dart';
import '../view_model/details_state.dart';
import '../widgets/movie_details_status_custom_widget.dart';
import '../widgets/movie_poster_title_custom_widget.dart';
import '../widgets/movie_related_list_custom_widget.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;

  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isSaved = false;
  late final GetMovieDetailsUseCase detailsUseCase;
  late final GetSimilarMoviesUseCase similarUseCase;

  @override
  void initState() {
    super.initState();
    final api = DetailsApi();
    final dataSource = DetailsDataSourceImpl(detailsApi: api);
    final repo = DetailsRepoImpl(dataSource);
    detailsUseCase = GetMovieDetailsUseCase(repo);
    similarUseCase = GetSimilarMoviesUseCase(repo);
    _checkIfMovieIsSaved();
  }

  void _checkIfMovieIsSaved() async {
    final saved = await context.read<WatchListCubit>().isMovieSaved(
      widget.movieId,
    );
    setState(() {
      isSaved = saved;
    });
  }

  void _toggleSaveMovie(BuildContext innerContext) async {
    final currentState = innerContext.read<DetailsCubit>().state;
    if (currentState.movieDetails == null) return;
    final movie = currentState.movieDetails!;
    if (isSaved) {
      await context.read<WatchListCubit>().removeFromWatchList(widget.movieId);
      setState(() {
        isSaved = false;
      });
      _showFloatingSnackBar(
        AppStrings.removedFromWatchList,
        AppColors.redColor,
      );
    } else {
      final watchListEntity = WatchListEntity(
        id: widget.movieId,
        title: movie.title,
        posterPath: movie.posterPath,
        releaseDate: movie.releaseDate,
        voteAverage: movie.voteAverage,
        genre: (movie.genres.isNotEmpty) ? movie.genres.first : 'Unknown',
        runtime: movie.runtime,
      );
      await context.read<WatchListCubit>().addToWatchList(watchListEntity);
      setState(() {
        isSaved = true;
      });
      _showFloatingSnackBar(AppStrings.savedToWatchlist, AppColors.greyColor);
    }
  }

  void _showFloatingSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: AppColors.whiteColor,
              fontWeight: .bold,
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        behavior: .floating,
        margin: .all(AppSizes.h20),
        shape: RoundedRectangleBorder(borderRadius: .circular(AppSizes.r10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(detailsUseCase, similarUseCase)
        ..getMovieDetails(widget.movieId)
        ..getSimilarMovies(widget.movieId),
      child: Builder(
        builder: (innerContext) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: CustomAppBar(
              isSaved: isSaved,
              onSaveTapped: () => _toggleSaveMovie(innerContext),
            ),
            body: BlocConsumer<DetailsCubit, DetailsState>(
              listener: (context, state) {
                if (state.movieDetailsState == .error) {
                  _showFloatingSnackBar(
                    state.movieDetailsMessage,
                    AppColors.redColor,
                  );
                }
              },
              builder: (context, state) {
                if (state.movieDetailsState == .loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.orangeColor,
                    ),
                  );
                } else if (state.movieDetailsState == .error) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: AppColors.redColor,
                          size: AppSizes.sp50,
                        ),
                        verticalSpace(10),
                        Text(
                          state.movieDetailsMessage,
                          style: const TextStyle(color: AppColors.whiteColor),
                        ),
                        verticalSpace(10),
                        MaterialButton(
                          onPressed: () {
                            innerContext.read<DetailsCubit>().getMovieDetails(
                              widget.movieId,
                            );
                            innerContext.read<DetailsCubit>().getSimilarMovies(
                              widget.movieId,
                            );
                          },
                          child: const Text(AppStrings.retry),
                        ),
                      ],
                    ),
                  );
                } else if (state.movieDetails != null) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        MovieBannerCustomWidget(
                          rateValue: state.movieDetails!.voteAverage,
                          backdropPath: state.movieDetails!.backdropPath,
                        ),
                        MoviePosterTitleCustomWidget(
                          title: state.movieDetails!.title,
                          posterUrl: state.movieDetails!.posterPath,
                        ),
                        verticalSpace(16),
                        MovieDetailsStatusCustomWidget(
                          movieDetailsEntity: state.movieDetails!,
                        ),
                        verticalSpace(20),
                        MovieRelatedListCustomWidget(
                          similarMovies: state.similarMovies,
                          isLoading: state.similarMoviesState == .loading,
                          errorMessage: state.similarMoviesMessage,
                        ),
                        verticalSpace(20),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
