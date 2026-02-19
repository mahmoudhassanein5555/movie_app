import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/feature/home/domain/use_case/popular_movies_use_case.dart';
import 'package:movie_app/feature/home/domain/use_case/recommended_movies_use_case.dart';
import 'package:movie_app/feature/home/domain/use_case/releases_movies_use_case.dart';
import 'package:movie_app/feature/home/presentation/view_model/home_state.dart';
import 'package:movie_app/feature/home/presentation/view_model/popular_cubit/home-cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/recommended_cubit/home_recommended_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/release_cubit/home_release_cubit.dart';
import 'package:movie_app/feature/home/presentation/widgets/custom_poster_widget.dart';
import 'package:movie_app/feature/home/presentation/widgets/image_item_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final RecommendedCubit _homeCubit;
  late final PopularCubit _popularCubit;
  late final ReleasesCubit _releasesCubit;
  @override
  void initState() {
    super.initState();
    _homeCubit = RecommendedCubit(injectRecommendedMoviesUseCase());
    _homeCubit.intent(RecommendedMoviesIntent());
    _popularCubit = PopularCubit(injectPopularMoviesUseCase());
    _popularCubit.intent(PopularMoviesIntent());
    _releasesCubit = ReleasesCubit(injectReleaseMoviesUseCase());
    _releasesCubit.intent(ReleasesMoviesIntent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              right: AppSizes.w25,
              left: AppSizes.w25,
              top: AppSizes.h50,
              bottom: AppSizes.h50,
            ),

            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.h250,
                  width: double.infinity,
                  child: BlocBuilder<RecommendedCubit, HomeState>(
                    bloc: _homeCubit,
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is HomeSuccess) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.listOfMovies.length,
                          itemBuilder: (context, index) {
                            final movie = state.listOfMovies[index];
                            return TopMovieCard(
                              index: index,
                              imageUrl:
                                  MoviesApiConstants.imagePath +
                                  movie.posterPath!,
                              onTap: () {},
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: AppSizes.w20),
                        );
                      }

                      if (state is HomeError) {
                        return Center(
                          child: Card(
                            child: Text(
                              state.message,
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontSize: AppSizes.sp30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(child: Text(AppStrings.unexpectedState));
                      }
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.popular,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSizes.sp14,
                      fontFamily: AppStrings.fontPoppins,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.h19),
                BlocBuilder<PopularCubit, HomeState>(
                  bloc: _popularCubit,
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeSuccess) {
                      return SizedBox(
                        height: AppSizes.h146,
                        width: double.infinity,
                        child: CustomPosterWidget(state: state, onTap: () {}),
                      );
                    }
                    if (state is HomeError) {
                      return Center(
                        child: Card(
                          child: Text(
                            state.message,
                            style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: AppSizes.sp30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: Text("Unexpected state"));
                    }
                  },
                ),
                SizedBox(height: AppSizes.h19),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.release,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSizes.sp14,
                      fontFamily: AppStrings.fontPoppins,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.h19),
                BlocBuilder<ReleasesCubit, HomeState>(
                  bloc: _releasesCubit,
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeSuccess) {
                      return SizedBox(
                        height: AppSizes.h146,
                        width: .infinity,
                        child: CustomPosterWidget(state: state, onTap: () {}),
                      );
                    }
                    if (state is HomeError) {
                      return Center(
                        child: Card(
                          child: Text(
                            state.message,
                            style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: AppSizes.sp30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: Text(AppStrings.unexpectedState));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
