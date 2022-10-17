import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_counter/common/locale_model.dart';
import 'package:provider_simple_counter/common/localization.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languagesList = [];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${Localization.supportedLocales[index]}'),
            onTap: () {
              context
                  .read<LocaleModel>()
                  .changeLocale(Localization.supportedLocales[index]);
            },
            selected: context.watch<LocaleModel>().currentLocale ==
                Localization.supportedLocales[index],
          );
        },
        itemCount: Localization.supportedLocales.length,
      ),
    );
  }
}
