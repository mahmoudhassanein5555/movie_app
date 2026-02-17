import 'package:flutter/material.dart';
import 'package:movie_app/feature/app_section/widgets/custom_bottom_nav_bar.dart';
import 'package:movie_app/feature/home/presentation/view/home_screen.dart';
import 'package:movie_app/feature/search/presentation/view/search_screen.dart';
import 'package:movie_app/feature/watch_list/presentation/view/watch_list_screen.dart';


class App extends StatefulWidget {
  const App({super.key});
  static const routeName = '/app';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


