import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets/app_images_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

class NoSearchResultsWidget extends StatelessWidget {
  const NoSearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Image.asset(
          AppImages.noResult,
          width: AppSizes.w76,
          height: AppSizes.h76,
        ),
        Text(
          AppStrings.noSearchResultFound,
          textAlign: .center,
          style: TextStyle(
            fontFamily: AppStrings.fontMontserrat,
            color: AppColors.whiteColor,
            fontSize: AppSizes.sp16,
            fontWeight: .w600,
          ),
        ),
        Text(
          AppStrings.watchListEmptySubtitle,
          textAlign: .center,
          style: TextStyle(
            fontFamily: AppStrings.fontMontserrat,
            color: AppColors.searchGreyColor,
            fontWeight: .w500,
            fontSize: AppSizes.sp12,
          ),
        ),
      ],
    );
  }
}
