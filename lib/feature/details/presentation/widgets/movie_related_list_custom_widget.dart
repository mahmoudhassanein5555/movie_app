import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

import '../../domain/entities/similar_movie_entity.dart';

class MovieRelatedListCustomWidget extends StatelessWidget {
  final List<SimilarMovieEntity> similarMovies;
  final bool isLoading;
  final String errorMessage;

  const MovieRelatedListCustomWidget({
    super.key,
    required this.similarMovies,
    this.isLoading = false,
    this.errorMessage = "",
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.orangeColor),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Text(
        errorMessage,
        style: const TextStyle(color: AppColors.redColor),
      );
    }

    if (similarMovies.isEmpty) {
      return Center(
        child: Text(
          AppStrings.noSimilarMoviesFound,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSizes.sp16,
            fontWeight: .bold,
            fontFamily: AppStrings.fontMontserrat,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: .only(left: AppSizes.w20, bottom: AppSizes.h10),
          child: Text(
            AppStrings.releatedMovies,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppSizes.sp15,
              fontWeight: .w500,
              fontFamily: AppStrings.fontMontserrat,
            ),
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: .symmetric(horizontal: AppSizes.w15),
          itemCount: similarMovies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            crossAxisSpacing: AppSizes.w4,
            mainAxisExtent: AppSizes.h145,
            mainAxisSpacing: AppSizes.h18,
          ),
          itemBuilder: (context, index) {
            final movie = similarMovies[index];
            return Container(
              margin: .symmetric(horizontal: AppSizes.w9),
              child: ClipRRect(
                borderRadius: .circular(AppSizes.sp10),
                child: movie.posterPath != null
                    ? CachedNetworkImage(
                        imageUrl:
                            "${MoviesApiConstants.imagePath}${movie.posterPath}",
                        fit: .cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Container(color: AppColors.greyColor),
              ),
            );
          },
        ),
      ],
    );
  }
}
