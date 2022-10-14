import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_counter/common/localization.dart';
import 'package:provider_simple_counter/data/models/counter.dart';

import '../common/theme/theme_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Localization.of(context).instruction,
            ),
            Consumer<Counter>(
              builder: (contex, counter, child) => Text(
                counter.count.toString(),
              ),
            ),
            Consumer<ThemeModel>(builder: (context, state, child) {
              return IconButton(
                  onPressed: context.read<ThemeModel>().changeTheme,
                  icon: Icon(context.read<ThemeModel>().isDark
                      ? Icons.sunny
                      : Icons.nightlight_round));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<Counter>().increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
