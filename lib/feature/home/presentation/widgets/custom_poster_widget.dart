import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomPosterWidget extends StatelessWidget {
  const CustomPosterWidget({super.key, required this.movies, this.onTap});
  final List<dynamic> movies;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),

            child: AspectRatio(
              aspectRatio: 100 / 146,
              child: CachedNetworkImage(
                imageUrl: MoviesApiConstants.imagePath + movie.posterPath!,
                fit: BoxFit.cover,
                placeholder: (_, _) => Center(
                  child: Skeletonizer(
                    enabled: true,
                    child: Container(color: AppColors.greyColor),
                  ),
                ),
                errorWidget: (_, _, _) => const ColoredBox(
                  color: AppColors.greyColor,
                  child: Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },

      separatorBuilder: (BuildContext context, int index) =>
          horizontalSpace(AppSizes.w20),
    );
  }
}
