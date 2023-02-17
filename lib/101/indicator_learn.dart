import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CenterCircularProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          LinearProgressIndicator()
        ],
      ),
    );
  }
}

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          // Temadan Verildi.
          // color: Colors.white,
          ),
    );
  }
}
