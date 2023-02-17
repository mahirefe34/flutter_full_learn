import 'dart:ui';

import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  CustomWidgetLearn({super.key});
  final String food = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: CustomFoodButton(
                  title: food,
                  onPressed: () {},
                ),
              ),
            )),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFoodButton(
            title: food,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _ColorUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets paddingAllNormal = EdgeInsets.all(8);
}

class CustomFoodButton extends StatelessWidget
    with _ColorUtility, _PaddingUtility {
  CustomFoodButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //backgroundColor: redColor ->  with _ColorUtility gücü ile yapıldı.
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: paddingAllNormal,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
