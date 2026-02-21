import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_sizes.dart';
import 'package:movie_app/feature/details/presentation/view/details_screen.dart';
import 'package:movie_app/feature/watch_list/domain/entites/watch_list_entity.dart';
import 'package:movie_app/feature/watch_list/presentation/widgets/watch_list_item_widget.dart';

class NonEmptyWatchListScreen extends StatelessWidget {
  final List<WatchListEntity> movies;
  const NonEmptyWatchListScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: AppSizes.h10),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return WatchListItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsScreen(movieId: movies[index].id),
              ),
            );
          },
          movie: movies[index],
        );
      },
    );
  }
}
