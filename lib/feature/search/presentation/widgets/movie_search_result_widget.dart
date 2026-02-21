import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets/app_icon_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieSearchResultWidget extends StatelessWidget {
  const MovieSearchResultWidget({
    super.key,
    required this.posterPath,
    required this.rateValue,
    required this.title,
    required this.releaseDate,
    required this.onTap,
  });
  final String? posterPath;
  final String? title;
  final double? rateValue;
  final String? releaseDate;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 10,
        children: [
          CachedNetworkImage(
            imageUrl: (posterPath != null && posterPath!.isNotEmpty)
                ? 'https://image.tmdb.org/t/p/w500$posterPath'
                : 'https://www.prokerala.com/movies/assets/img/no-poster.png',
            width: AppSizes.w95,
            height: AppSizes.h120,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColors.searchGreyColor,
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.white),
          ),

          horizontalSpace(10),
          Expanded(
            child: _SearchDetailsWidget(
              title: title,
              rateValue: rateValue,
              posterPath: posterPath,
              releaseDate: releaseDate,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchDetailsWidget extends StatelessWidget {
  const _SearchDetailsWidget({
    required this.title,
    required this.rateValue,
    required this.posterPath,
    required this.releaseDate,
  });

  final String? posterPath;
  final String? title;
  final double? rateValue;
  final String? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          title ?? '',
          style: TextStyle(
            fontFamily: AppStrings.fontMontserrat,
            color: AppColors.whiteColor,
            fontSize: AppSizes.sp16,
            fontWeight: .w400,
          ),
        ),
        verticalSpace(5),
        Row(
          spacing: 4,
          children: [
            SvgPicture.asset(
              AppIcons.star,
              width: AppSizes.w16,
              height: AppSizes.h16,
            ),
            horizontalSpace(4),
            Text(
              rateValue?.toStringAsFixed(1) ?? "0.0",
              style: TextStyle(
                fontFamily: AppStrings.fontMontserrat,
                fontSize: AppSizes.sp12,
                fontWeight: .w600,
                color: AppColors.orangeColor,
              ),
            ),
          ],
        ),
        Row(
          spacing: 4,
          children: [
            SvgPicture.asset(
              AppIcons.ticket,
              width: AppSizes.w16,
              height: AppSizes.h16,
            ),
            horizontalSpace(4),
            Text(
              releaseDate.toString(),
              style: TextStyle(
                fontFamily: AppStrings.fontMontserrat,
                fontSize: AppSizes.sp12,
                fontWeight: .w600,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        Row(
          spacing: 4,
          children: [
            SvgPicture.asset(
              AppIcons.calenderBlank,
              width: AppSizes.w16,
              height: AppSizes.h16,
            ),
            horizontalSpace(4),
            Text(
              releaseDate.toString(),
              style: TextStyle(
                fontFamily: AppStrings.fontMontserrat,
                fontSize: AppSizes.sp12,
                fontWeight: .w600,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
        Row(
          spacing: 4,
          children: [
            SvgPicture.asset(
              AppIcons.clock,
              width: AppSizes.w16,
              height: AppSizes.h16,
            ),
            horizontalSpace(4),
            Text(
              AppStrings.defultMinutes,
              style: TextStyle(
                fontFamily: AppStrings.fontMontserrat,
                fontSize: AppSizes.sp12,
                fontWeight: .w600,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
