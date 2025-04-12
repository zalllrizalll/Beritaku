import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  static const _theme = 'isDarkMode';

  Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_theme, isDarkMode);
  }

  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_theme) ?? false;
  }
}
