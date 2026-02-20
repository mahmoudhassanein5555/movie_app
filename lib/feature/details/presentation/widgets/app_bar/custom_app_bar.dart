import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/app_assets/app_icon_assets.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSaved;
  final VoidCallback onSaveTapped;

  const CustomAppBar({
    super.key,
    required this.isSaved,
    required this.onSaveTapped,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      scrolledUnderElevation: 0,
      leading: null,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(AppIcons.arrowLeft),
          ),
          const Text(
            AppStrings.details,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppStrings.fontMontserrat,
            ),
          ),
          GestureDetector(
            onTap: onSaveTapped,
            child: isSaved
                ? SvgPicture.asset(AppIcons.saveFilled)
                : SvgPicture.asset(AppIcons.save),
          ),
        ],
      ),
    );
  }
}
