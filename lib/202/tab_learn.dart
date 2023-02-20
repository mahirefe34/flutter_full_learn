import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //length: 2,
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody:
            true, //Arka planı kaldırır. İstenilen circular şekil oluşur.
        appBar: AppBar(
          bottom: TabBar(
            onTap: (int value) {
              print(value); //Hangi taba tıklandığını yakalayabiliriz.
            },
            padding: EdgeInsets.zero,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.red,
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(
          physics:
              const NeverScrollableScrollPhysics(), //Ekranda sağa sola kaydırma ile geçmez
          controller: _tabController,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.yellow),
            Container(color: Colors.green),
            Container(color: Colors.purple),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: TabBar(controller: _tabController, tabs: const [
            Tab(text: 'Page 1'),
            Tab(text: 'Page 2'),
            Tab(text: 'Page 3'),
            Tab(text: 'Page 4'),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

enum _MyTabViews { home, setting, favorite, profile }

extension _MyTabViewExtansion on _MyTabViews {}
