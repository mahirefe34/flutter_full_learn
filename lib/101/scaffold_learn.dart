import 'package:flutter/material.dart';

import 'container_sized_box_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Example'),
      ),
      body: const Text('Merhaba'),
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 200,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      bottomNavigationBar: Container(
        height: 100,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(currentIndex: 0, items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'aa'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'bb'),
        ]),
      ),
    );
  }
}
