import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/constants/app_assets/app_icon_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';

class MovieBannerCustomWidget extends StatelessWidget {
  final String? backdropPath;
  final double rateValue;

  const MovieBannerCustomWidget({
    super.key,
    required this.backdropPath,
    required this.rateValue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .bottomRight,
      children: [
        SizedBox(
          height: AppSizes.h210,
          width: .infinity,
          child: CachedNetworkImage(
            imageUrl: "${MoviesApiConstants.imagePath}$backdropPath",
            fit: .cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.orangeColor),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        Padding(
          padding: .only(right: AppSizes.w15, bottom: AppSizes.h10),
          child: ClipRRect(
            borderRadius: .circular(AppSizes.r8),
            child: Container(
              padding: .symmetric(
                vertical: AppSizes.w5,
                horizontal: AppSizes.h10,
              ),
              decoration: BoxDecoration(
                color: AppColors.lowBlackColor,
                borderRadius: .circular(AppSizes.r10),
              ),
              child: Row(
                mainAxisSize: .min,
                children: [
                  SvgPicture.asset(AppIcons.star),
                  horizontalSpace(5),
                  Text(
                    rateValue.toStringAsFixed(1),
                    style: const TextStyle(
                      color: AppColors.orangeColor,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
