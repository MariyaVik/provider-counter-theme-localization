import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../common/locale_model.dart';
import '../common/localization.dart';
import '../data/models/counter.dart';
import 'navigation.dart';
import 'theme/theme_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => LocaleModel())
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
          builder: (context, theme, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Localization.supportedLocales,
          locale: locale.currentLocale,
          title: 'Flutter Demo',
          theme: theme.theme,
          initialRoute: Navigation.initialRoute,
          onGenerateRoute: Navigation.onGenerateRoute,
        );
      }),
    );
  }
}
