import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets/app_images_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';

class EmptyWatchListScreen extends StatelessWidget {
  const EmptyWatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset(AppImages.noSavedMovies, width: AppSizes.w120),
          verticalSpace(16),
          Text(
            AppStrings.watchListEmptyTitle,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppStrings.fontPoppins,
              fontSize: AppSizes.sp18,
              fontWeight: .w600,
            ),
          ),
          verticalSpace(8),
          Text(
            AppStrings.watchListEmptySubtitle,
            textAlign: .center,
            style: TextStyle(
              color: AppColors.greyColor,
              fontFamily: AppStrings.fontPoppins,
              fontSize: AppSizes.sp14,
            ),
          ),
        ],
      ),
    );
  }
}
