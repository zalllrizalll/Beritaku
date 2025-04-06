import 'package:beritaku/pages/app.dart';
import 'package:beritaku/utils/general_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = GeneralObserver();
  runApp(const App());
}
