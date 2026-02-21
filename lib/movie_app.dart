import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/app_section/app_section.dart';
import 'package:movie_app/feature/watch_list/data/repository/data_source/watch_list_data_source_imp.dart';
import 'package:movie_app/feature/watch_list/data/repository/repo/watch_list_repo_imp.dart';
import 'package:movie_app/feature/watch_list/domain/use_case/get_watch_list_use_case.dart';
import 'package:movie_app/feature/watch_list/presentation/view_model/watch_list_cubit.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) {
            final dataSource = WatchListDataSourceImp();
            final repo = WatchListRepoImp(dataSource);
            final useCase = GetWatchListUseCase(repo);
            return WatchListCubit(useCase)..getWatchList();
          },
          child: MaterialApp(debugShowCheckedModeBanner: false, home: App()),
        );
      },
    );
  }
}
