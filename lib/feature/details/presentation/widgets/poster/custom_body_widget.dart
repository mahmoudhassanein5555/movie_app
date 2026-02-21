import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/core/utils/spacing.dart';

class CustomBodyWidget extends StatelessWidget {
  const CustomBodyWidget({super.key, required this.child, required this.title});

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: AppSizes.w29, vertical: AppSizes.h12),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Transform.translate(
            offset: Offset(0, -375 / 5.5),
            child: Align(
              alignment: .topCenter,
              heightFactor: AppSizes.h0,
              child: ClipRRect(
                borderRadius: .circular(AppSizes.r16),
                child: child,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(child: title),
        ],
      ),
    );
  }
}
