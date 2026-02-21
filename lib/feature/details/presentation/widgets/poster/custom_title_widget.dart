import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: .visible,
      title ?? "Unknown Title",
      style: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: .bold,
        fontSize: AppSizes.sp19,
        fontFamily: AppStrings.fontMontserrat,
      ),
    );
  }
}
