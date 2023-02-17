import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const StackDemoView(),
    );
  }
}

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                    bottom: 25, child: Container(color: Colors.red)),
                Positioned(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    bottom: 0,
                    child: const Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ))
              ],
            )),
        const Spacer(flex: 6)
      ],
    );
  }
}

class _StackFirsLearn extends StatelessWidget {
  const _StackFirsLearn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.red,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Container(
            color: Colors.blueAccent,
            height: 100,
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 25,
          height: 100,
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
