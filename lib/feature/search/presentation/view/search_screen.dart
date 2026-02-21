import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';
import 'package:movie_app/feature/details/presentation/view/details_screen.dart';
import 'package:movie_app/feature/search/domain/use_case/search_use_case.dart';
import 'package:movie_app/feature/search/presentation/view_model/search_cubit.dart';
import 'package:movie_app/feature/search/presentation/widgets/movie_search_result_widget.dart';
import 'package:movie_app/feature/search/presentation/widgets/no_search_results_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController searchController;
  late final SearchCubit _searchCubit;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _searchCubit = SearchCubit(injectSearchUseCase());
  }

  @override
  void dispose() {
    _searchCubit.close();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppStrings.search,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSizes.sp16,
            fontWeight: .w600,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w24),
        child: Column(
          children: [
            verticalSpace(20),
            TextField(
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSizes.sp14,
              ),
              controller: searchController,
              onChanged: (value) {
                _searchCubit.intent(SearchIntentEvent(value));
              },
              cursorColor: AppColors.whiteColor,
              decoration: InputDecoration(
                fillColor: AppColors.searchGreyColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            verticalSpace(10),
            BlocBuilder<SearchCubit, SearchState>(
              bloc: _searchCubit,
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Center(child: SizedBox(height: 10));
                }
                if (state is SearchLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orangeColor,
                      ),
                    ),
                  );
                }
                if (state is SearchSuccess) {
                  final results = state.results.results;
                  if (results.isEmpty) {
                    return const Expanded(child: NoSearchResultsWidget());
                  }

                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: AppSizes.h24),
                      itemCount: results.length,
                      separatorBuilder: (context, index) =>
                          verticalSpace(AppSizes.h16),
                      itemBuilder: (context, index) {
                        final movie = results[index];
                        String realease = movie.releaseDate;
                        return MovieSearchResultWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(movieId: movie.id),
                              ),
                            );
                          },
                          posterPath: movie.posterPath,
                          releaseDate: realease,
                          rateValue: movie.voteAverage,
                          title: movie.title,
                        );
                      },
                    ),
                  );
                }
                if (state is SearchError) {
                  return const Expanded(child: NoSearchResultsWidget());
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
