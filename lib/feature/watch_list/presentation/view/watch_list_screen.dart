import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_colors.dart';
import 'package:movie_app/core/constants/app_strings.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/watch_list_cubit.dart';
import '../view_model/watch_list_state.dart';
import 'empty_watch_list_screen.dart';
import 'non_empty_watch_list_screen.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.watchList,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontFamily: AppStrings.fontPoppins,
            fontSize: AppSizes.sp18,
            fontWeight: .w600,
          ),
        ),
      ),
      body: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          if (state is WatchListLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.skyBlueColor),
            );
          }

          if (state is WatchListSuccess) {
            return NonEmptyWatchListScreen(movies: state.movies);
          }

          if (state is WatchListEmpty) {
            return const EmptyWatchListScreen();
          }
          if (state is WatchListError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: AppColors.redColor),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
