import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

class TitleLoadingWidget extends StatelessWidget {
  const TitleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .only(top: AppSizes.h20),
      height: AppSizes.h20,
      width: AppSizes.w150,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: .circular(AppSizes.r8),
      ),
    );
  }
}
