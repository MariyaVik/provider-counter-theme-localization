import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_counter/common/localization.dart';
import 'package:provider_simple_counter/data/models/counter.dart';

import '../common/theme/theme_model.dart';
import 'navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final settingButtons = [
      Consumer<ThemeModel>(builder: (context, state, child) {
        return IconButton(
            onPressed: context.read<ThemeModel>().changeTheme,
            icon: Icon(context.read<ThemeModel>().isDark
                ? Icons.sunny
                : Icons.nightlight_round));
      }),
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(NavRouteName.languages);
          },
          icon: const Icon(Icons.language))
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: settingButtons,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            _PresentationWidget(),
            _ActivitiesWidget(),
          ],
        ),
      ),
    );
  }
}

class _PresentationWidget extends StatelessWidget {
  const _PresentationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Localization.of(context).instruction,
        ),
        Consumer<Counter>(
          builder: (contex, counter, child) => Text(
            counter.count.toString(),
          ),
        ),
      ],
    );
  }
}

class _ActivitiesWidget extends StatelessWidget {
  const _ActivitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: context.read<Counter>().decrement,
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: context.read<Counter>().increment,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
