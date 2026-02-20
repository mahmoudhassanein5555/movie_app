import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constant.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/feature/details/presentation/widgets/poster/error_template.dart';
import 'package:movie_app/feature/details/presentation/widgets/poster/loading_template.dart';

class CustomPosterWidget extends StatelessWidget {
  const CustomPosterWidget({super.key, required this.posterUrl});
  final String? posterUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${MoviesApiConstants.imagePath}${posterUrl ?? ""}",
      imageBuilder: (context, imageProvider) => Container(
        width: AppSizes.w95,
        height: AppSizes.h120,
        decoration: BoxDecoration(
          borderRadius: .circular(AppSizes.r16),
          image: DecorationImage(image: imageProvider, fit: .cover),
        ),
      ),
      placeholder: (context, _) => LoadingTemplate(),
      errorWidget: (context, _, error) =>
          ErrorTemplate(error: error.toString()),
    );
  }
}
