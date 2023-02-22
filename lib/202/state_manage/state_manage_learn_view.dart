import 'package:flutter/material.dart';

import 'state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isVisible ? Colors.blue : Colors.green,
        title: isOpacitiy ? const Text('1') : const Text('2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpacity();
          changeVisiblity();
        },
      ),
    );
  }
}
