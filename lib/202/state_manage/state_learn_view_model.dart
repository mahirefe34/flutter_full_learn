import 'package:flutter/material.dart';

import 'state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  bool isOpacitiy = false;
  bool isVisible = false;

  void changeVisiblity() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacitiy = !isOpacitiy;
    });
  }
}
