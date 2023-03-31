import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common/locale_model.dart';
import '../common/localization.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleModel>(builder: (context, localeState, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text(Localization.of(context).select),
          ),
          body: ListView.separated(
            itemBuilder: (context, index) {
              var locale = Localization.supportedLocales[index];
              return ListTile(
                title: Text(lookupAppLocalizations(locale).language),
                subtitle: Text(lookupAppLocalizations(locale).language_en),
                onTap: () {
                  context.read<LocaleModel>().changeLocale(locale);
                },
                selected: localeState.currentLocale == locale,
              );
            },
            itemCount: Localization.supportedLocales.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ));
    });
  }
}
