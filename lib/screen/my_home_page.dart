import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:sample_background/state/my_home_state.dart';
import 'package:sample_background/view_model/my_home_view_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyHomePageStateNotifier, MyHomePageState>(
      create: ((context) => MyHomePageStateNotifier()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutterラボ'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('widgetAをビルド');
    return const Text('You have pushed the button this many times');
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('widgetBをビルド');
    final counter =
        context.select<MyHomePageState, int>((state) => state.counter);
    return Text('$counter');
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('widgetCをビルド');
    final VoidCallback increment =
        context.read<MyHomePageStateNotifier>().increment;
    return ElevatedButton(
      onPressed: () {
        increment();
      },
      child: const Text('カウント'),
    );
  }
}
