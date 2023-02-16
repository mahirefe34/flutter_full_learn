import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Card(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            shape: StadiumBorder(),
            child: SizedBox(
              height: 100,
              width: 200,
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          const _CustomCard(
            child: Text('Mahir'),
          ),
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  const _CustomCard({Key? key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Center(child: child),
      ),
    );
  }
}
