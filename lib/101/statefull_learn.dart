import 'package:flutter/material.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _counterValue = 0;

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
      appBar: AppBar(),
      body: Center(
          child: Text(
        _counterValue.toString(),
        style: Theme.of(context).textTheme.headlineLarge,
      )),
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
    return FloatingActionButton(
      onPressed: () {
        // incrementValue();
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  FloatingActionButton _decrementButton() {
    return FloatingActionButton(
      onPressed: () {
        //decrementValue();
        _updateCounter(false);
      },
      child: const Icon(Icons.remove),
    );
  }
}


// Temelden zirveye 6 -- dakika 20 de kaldım. 