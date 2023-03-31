import 'package:flutter/material.dart';

import 'localization.dart';

class LocaleModel extends ChangeNotifier {
  Locale _currentLocale = Localization.ru;
  Locale get currentLocale => _currentLocale;

  changeLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
