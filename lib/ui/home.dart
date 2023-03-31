import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/localization.dart';
import '../data/models/counter.dart';
import 'navigation.dart';
import 'theme/theme_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        title: Text(Localization.of(context).title),
        actions: settingButtons,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Consumer<Counter>(
          builder: (contex, counter, child) => Text(
            counter.count.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
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
