import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widget/callback_dropdown.dart';

import '../product/widget/button/answer_button.dart';
import '../product/widget/button/loading_button.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(
            onUserSelected: (CallBackUser user) {
              print(user.name);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
            title: 'MBE',
            onPressed: () async {
              await Future.delayed(const Duration(milliseconds: 2000));
            },
          ),
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallBackUser && other.name == name && other.id == id;
  }

  // TODO: Dummy Remove It
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser('mbe1', 1),
      CallBackUser('mbe2', 2),
    ];
  }
}
