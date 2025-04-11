import 'package:beritaku/data/models/article_hive.dart';
import 'package:beritaku/pages/app.dart';
import 'package:beritaku/utils/general_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(ArticleHiveAdapter());

  await Hive.openBox<ArticleHive>('favourite_articles');
  Bloc.observer = GeneralObserver();
  runApp(const App());
}
