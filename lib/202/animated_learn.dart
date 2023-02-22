import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        'data',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
