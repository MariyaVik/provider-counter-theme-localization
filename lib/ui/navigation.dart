import 'package:flutter/material.dart';

import 'home.dart';
import 'language_setting.dart';

abstract class NavRouteName {
  static const home = '/';
  static const languages = '/languages';
}

class Navigation {
  static const initialRoute = NavRouteName.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavRouteName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeScreen(title: 'Provider'));
      case NavRouteName.languages:
        return MaterialPageRoute(builder: (context) => const LanguageScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Text('Navigation error!!!'));
    }
  }
}
