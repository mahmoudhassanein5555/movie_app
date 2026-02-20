import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

class ErrorTemplate extends StatelessWidget {
  const ErrorTemplate({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.w95,
      height: AppSizes.h120,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: .circular(AppSizes.r16),
      ),
      child: const Center(
        child: Icon(Icons.broken_image, color: AppColors.whiteColor),
      ),
    );
  }
}
