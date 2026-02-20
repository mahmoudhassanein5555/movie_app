import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';

class BuildTagWidget extends StatelessWidget {
  const BuildTagWidget({super.key, required this.icon, required this.text});
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: AppSizes.h20),
        horizontalSpace(5),
        Text(
          text,
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: AppSizes.sp14,
            fontFamily: AppStrings.fontMontserrat,
          ),
        ),
      ],
    );
  }
}
