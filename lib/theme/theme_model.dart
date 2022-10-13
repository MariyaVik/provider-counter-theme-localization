import 'package:flutter/material.dart';
import 'package:provider_simple_counter/theme/theme_dart.dart';
import 'package:provider_simple_counter/theme/theme_light.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeData get theme => _isDark ? appThemeDark : appThemeLight;

  changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
