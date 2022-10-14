import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_counter/common/localization.dart';
import 'package:provider_simple_counter/data/models/counter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common/theme/theme_model.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeModel())
      ],
      child: Consumer<ThemeModel>(builder: (context, state, child) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Localization.supportedLocales,
          title: 'Flutter Demo',
          theme: state.theme,
          home: const MyHomePage(title: 'Provider'),
        );
      }),
    );
  }
}
