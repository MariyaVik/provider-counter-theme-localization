import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_counter/data/models/counter.dart';
import 'package:provider_simple_counter/theme/theme_model.dart';

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(
              builder: (contex, counter, child) => Text(
                counter.count.toString(),
              ),
            ),
            Consumer<ThemeModel>(builder: (context, state, child) {
              return IconButton(
                  onPressed: context.read<ThemeModel>().changeTheme,
                  icon: context.read<ThemeModel>().isDark
                      ? const Icon(Icons.nightlight)
                      : const Icon(Icons.wb_sunny_outlined));
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
