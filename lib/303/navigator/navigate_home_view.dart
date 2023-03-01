import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/mixin/navigator_mixin.dart';

import '../../product/navigator/navigator_custom.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});
  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView>
    with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () async {
            //With mixin
            await router.pushToPage(
              NavigateCustomEnum.homeDetail,
              arguments: "mbe37",
            );
            //with manager
            /* await NavigatorManager.instance.pushToPage(
              NavigateCustomEnum.homeDetail,
              arguments: "mbe37",
            ); */

            /* Navigator.of(context).pushNamed(
                NavigateRoutesEnum.homeDetail.withParaf,
                arguments: "mbe"); */
          },
          child: const Icon(Icons.forward)),
    );
  }
}
