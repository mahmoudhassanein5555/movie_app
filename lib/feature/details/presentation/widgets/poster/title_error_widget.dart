import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/utils/app_sizes.dart';

class TitleErrorWidget extends StatelessWidget {
  const TitleErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.h50,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(AppSizes.r16),
        color: AppColors.greyColor,
      ),
      child: const Center(child: Icon(Icons.error, color: AppColors.redColor)),
    );
  }
}
