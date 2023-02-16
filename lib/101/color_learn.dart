import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  ColorLearn({super.key});
  final ColorsItems colorItems = ColorsItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: colorItems.porchase,
        child: const Text('deneme'),
      ),
    );
  }
}

class ColorsItems {
  final Color porchase = const Color(0xffEDBF61);
  final Color sulu = const Color.fromRGBO(198, 237, 97, 1);
}
