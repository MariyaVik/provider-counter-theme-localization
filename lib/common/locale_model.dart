import 'package:flutter/material.dart';
import 'package:provider_simple_counter/common/localization.dart';

class LocaleModel extends ChangeNotifier {
  Locale _currentLocale = Localization.ru;
  Locale get currentLocale => _currentLocale;

  changeLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
