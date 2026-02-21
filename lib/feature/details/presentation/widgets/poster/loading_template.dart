import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

class LoadingTemplate extends StatelessWidget {
  const LoadingTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.w95,
      height: AppSizes.h120,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: .circular(AppSizes.r16),
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: AppSizes.w2,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
