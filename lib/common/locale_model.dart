import 'package:flutter/material.dart';
import 'package:provider_simple_counter/common/localization.dart';

class LocaleModel extends ChangeNotifier {
  Locale _currentLocale = Localization.ru;
  Locale get currentLocale => _currentLocale;

  changeLocale(String? newLocale) {
    if (newLocale != null) _currentLocale = Locale(newLocale);
    notifyListeners();
  }
}
