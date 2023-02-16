import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: const [
        TitleTextWidget(title: 'Mahir'),
        NulableTitleTextWidget(title: 'Burak'),
        NulableTitleTextWidget(),
      ]),
    );
  }
}

class NulableTitleTextWidget extends StatelessWidget {
  const NulableTitleTextWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "Efe");
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
