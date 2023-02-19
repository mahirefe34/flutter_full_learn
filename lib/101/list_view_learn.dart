import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FittedBox(
            child: Text(
              'MERHABA',
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
            ),
          ),
          Container(color: Colors.red, height: 600),
          const Divider(),
          SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(color: Colors.red, width: 200),
                  Container(color: Colors.yellow, width: 200),
                  Container(color: Colors.green, width: 200),
                ],
              )),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
