import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                const Spacer(flex: 4), //Boşluk Bırakır.
                Expanded(flex: 2, child: Container(color: Colors.green)),
                Expanded(flex: 2, child: Container(color: Colors.yellow)),
                Expanded(flex: 2, child: Container(color: Colors.purple)),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('data'),
                  Text('data2'),
                  Text('data3'),
                ],
              )),
          Expanded(flex: 2, child: Container(color: Colors.yellow)),
          Expanded(flex: 2, child: Container(color: Colors.purple)),
        ],
      ),
    );
  }
}
