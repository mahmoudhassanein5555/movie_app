import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/feature/watch_list/data/model/watch_list_model.dart';
import 'package:movie_app/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WatchListModelAdapter());
  runApp(const MovieApp());
}
