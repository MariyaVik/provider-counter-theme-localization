import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization {
  static const en = Locale('en');
  static const ru = Locale('ru');
  static const es = Locale('es');
  static const ar = Locale('ar');

  static const supportedLocales = [en, ru, es, ar];

  static LocalizationsDelegate<AppLocalizations> get delegate =>
      AppLocalizations.delegate;

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;

  static bool isEn(Locale locale) => locale == en;

  const Localization._();
}
