import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  PaddingLearn({super.key});
  final ProjectPadding pagePadding = ProjectPadding();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Container(
              color: Colors.white,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: pagePadding.pagePaddingVertical,
            child: Container(
              color: Colors.white,
              height: 200,
            ),
          ),
          Padding(
            padding: ProjectPadding.pagePaddingAll50,
            child: Container(
              color: Colors.white,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectPadding {
  final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingAll50 = EdgeInsets.all(50.0);
}
