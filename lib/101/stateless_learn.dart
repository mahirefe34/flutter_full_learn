import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});
  final String title1 = 'Mahir';
  final String title2 = 'Burak';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TitleTextWidget(title: title1),
        _emptyBox(),
        NulableTitleTextWidget(title: title2),
        _emptyBox(),
        const NulableTitleTextWidget(),
        _emptyBox(),
      ]),
    );
  }

  SizedBox _emptyBox() => const SizedBox(height: 10);
}

class NulableTitleTextWidget extends StatelessWidget {
  const NulableTitleTextWidget({super.key, this.title});
  final String? title;
  final String title3 = 'Efe';

  @override
  Widget build(BuildContext context) {
    return Text(title ?? title3);
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
