import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_counter/common/locale_model.dart';
import 'package:provider_simple_counter/common/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var locale = Localization.supportedLocales[index];
          return ListTile(
            title: Text(lookupAppLocalizations(locale).language),
            subtitle: Text(lookupAppLocalizations(locale).language_en),
            onTap: () {
              context.read<LocaleModel>().changeLocale(locale);
            },
            selected: context.watch<LocaleModel>().currentLocale == locale,
          );
        },
        itemCount: Localization.supportedLocales.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
