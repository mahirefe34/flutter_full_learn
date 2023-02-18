import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/indicator_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController();
  int _currentPageIndex = 0;
  void _updateCurrentIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        // controller: PageController(viewportFraction: 0.7), Sayfaları sıkıştırır.
        // padEnds: false, Tam soldan başlamasını sağlar.   (viewportFraction: 0.7) durumda daha iyi gözüküyor.
        controller: _pageController,
        onPageChanged: _updateCurrentIndex,
        children: [
          const IndicatorLearn(),
          IconLearnView(),
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceInOut);
            },
            child: const Icon(Icons.chevron_left_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceInOut);
            },
            child: const Icon(Icons.chevron_right_outlined),
          ),
        ],
      ),
    );
  }
}
