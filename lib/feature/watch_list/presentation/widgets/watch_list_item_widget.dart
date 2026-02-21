import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_assets/app_icon_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/spacing.dart';
import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';

class WatchListItem extends StatelessWidget {
  final WatchListEntity movie;
  const WatchListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              '${MoviesApiConstants.imagePath}${movie.posterPath}',
              height: 120.h,
              width: 95.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 120.h,
                width: 95.w,
                color: AppColors.greyColor,
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontFamily: AppStrings.fontPoppins,
                    fontWeight: .w400,
                  ),
                ),
                verticalSpace(8),

                _buildInfoRow(
                  AppIcons.star,
                  movie.voteAverage.toStringAsFixed(1),
                  AppColors.orangeColor,
                ),

                _buildInfoRow(
                  AppIcons.ticket,
                  movie.genre,
                  AppColors.whiteColor,
                ),

                _buildInfoRow(
                  AppIcons.calenderBlank,
                  movie.releaseDate.split('-')[0],
                  AppColors.whiteColor,
                ),

                _buildInfoRow(
                  AppIcons.clock,
                  "${movie.runtime} Minutes",
                  AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 16.w,
            height: 16.h,

            colorFilter: ColorFilter.mode(
              iconPath == AppIcons.star
                  ? AppColors.orangeColor
                  : AppColors.whiteColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12.sp,
              fontFamily: AppStrings.fontPoppins,
            ),
          ),
        ],
      ),
    );
  }
}
