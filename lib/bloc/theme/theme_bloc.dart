import 'package:beritaku/data/repository/theme_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc(this.themeRepository) : super(ThemeState(ThemeMode.light)) {
    on<LoadThemeEvent>((event, emit) async {
      final themeMode = await themeRepository.isDarkMode();
      emit(ThemeState(themeMode ? ThemeMode.dark : ThemeMode.light));
    });

    on<ChangeThemeEvent>((event, emit) async {
      await themeRepository.setDarkMode(event.isDarkMode);
      emit(ThemeState(event.isDarkMode ? ThemeMode.dark : ThemeMode.light));
    });
  }
}
