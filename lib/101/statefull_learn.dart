import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

import '../product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _counterValue = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;

  /* void incrementValue() {
    setState(() {
      _counterValue = _counterValue + 1;
    });
  }

  void decrementValue() {
    setState(() {
      _counterValue = _counterValue - 1;
    });
  } */

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _counterValue = _counterValue + 1;
      });
    } else {
      setState(() {
        _counterValue = _counterValue - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_welcomeTitle),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            _counterValue.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          )),
          const Placeholder(),
          const CounterHelloButton(), //State tekrar çizilmesin diye product altında ayrıldı.
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _decrementButton(),
          const SizedBox(width: 10),
          _incrementButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    print('a');
    return FloatingActionButton(
      onPressed: () {
        // incrementValue();
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  FloatingActionButton _decrementButton() {
    print('b');

    return FloatingActionButton(
      onPressed: () {
        //decrementValue();
        _updateCounter(false);
      },
      child: const Icon(Icons.remove),
    );
  }
}
