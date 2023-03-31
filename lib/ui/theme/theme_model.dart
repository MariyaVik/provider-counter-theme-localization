import 'package:flutter/material.dart';

import 'theme_dark.dart';
import 'theme_light.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeData get theme => _isDark ? appThemeDark : appThemeLight;

  changeTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
