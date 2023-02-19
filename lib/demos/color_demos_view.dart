//Bİr ekran olacak.
//BU ekranda 3 button ve bunlara basınca renk değişimi olacak
//Seçili olan buutton selected icon olsun

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: const [
          BottomNavigationBarItem(
              icon: _ColoredContainer(color: Colors.red), label: 'Red'),
          BottomNavigationBarItem(
              icon: _ColoredContainer(color: Colors.yellow), label: 'Yellow'),
          BottomNavigationBarItem(
              icon: _ColoredContainer(color: Colors.blue), label: 'Blue'),
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    } else {}
  }
}

enum _MyColors { red, yellow, blue }

class _ColoredContainer extends StatelessWidget {
  const _ColoredContainer({
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
