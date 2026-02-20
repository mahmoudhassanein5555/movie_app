import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets/app_icon_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';
import 'package:movie_app/feature/details/presentation/widgets/build_tag_widget.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsStatusCustomWidget extends StatelessWidget {
  final MovieDetailsEntity movieDetailsEntity;

  const MovieDetailsStatusCustomWidget({
    super.key,
    required this.movieDetailsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: AppSizes.w20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              BuildTagWidget(
                icon: AppIcons.calenderBlank,
                text: movieDetailsEntity.releaseDate.split("-")[0],
              ),

              horizontalSpace(10),
              Container(width: 2, height: 20, color: AppColors.greyColor),
              horizontalSpace(10),

              BuildTagWidget(
                icon: AppIcons.clock,
                text: "${movieDetailsEntity.runtime} Min",
              ),

              horizontalSpace(10),
              Container(width: 2, height: 20, color: AppColors.greyColor),
              horizontalSpace(10),

              BuildTagWidget(
                icon: AppIcons.ticket,
                text: movieDetailsEntity.genres.first,
              ),
            ],
          ),
          verticalSpace(20),
          Text(
            movieDetailsEntity.overview,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppSizes.sp13,
              fontFamily: AppStrings.fontMontserrat,
              fontWeight: .w600,
            ),
            textAlign: .start,
          ),
        ],
      ),
    );
  }
}
