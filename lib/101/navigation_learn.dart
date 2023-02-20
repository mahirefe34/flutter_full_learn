import 'package:flutter/material.dart';

import 'navigate_detail_learn.dart';

class NagigationLearn extends StatefulWidget {
  const NagigationLearn({super.key});

  @override
  State<NagigationLearn> createState() => _NagigationLearnState();
}

class _NagigationLearnState extends State<NagigationLearn>
    with NavigatorManager {
  List<int> selectedItems = [];
  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await NavigateToWidgetNormal<bool>(
                  context,
                  NavigateDetailLearn(
                    isOkey: selectedItems.contains(index),
                  ));

              if (response is bool) {
                addSelected(index, response);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                color:
                    selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
      /* floatingActionButton: FloatingActionButton(
        // onPressed: () => NavigateToWidget(context, const NavigateDetailLearn()),
        onPressed: () async {
          final response = await NavigateToWidgetNormal<bool>(
              context, const NavigateDetailLearn());

          if (response == true) {}
        },
        child: const Icon(Icons.navigate_next),
      ), */
    );
  }
}

mixin NavigatorManager {
  void NavigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      fullscreenDialog: true, //Aşağıdan yukarı doğru açılma
    ));
  }

  Future<T?> NavigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      fullscreenDialog: true, //Aşağıdan yukarı doğru açılma
    ));
  }
}
