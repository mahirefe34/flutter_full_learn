import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconsizes = IconSizes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.red,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,

              //Aşağıdaki class çağırıldı.
              color: IconColors().froly,

              //Aşağıdaki classın bir instınsı yukarıda alındı ve o çağırıldı.
              size: iconsizes.iconSmall,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,

              //Renkler temadan çekildi.
              color: Theme.of(context).backgroundColor,

              //Statik olarak tanımlandı.
              size: IconSizes.iconMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
  static const double iconMedium = 50;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
