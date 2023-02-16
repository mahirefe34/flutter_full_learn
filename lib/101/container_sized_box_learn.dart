import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Text('abc' * 100),
          ),
          SizedBox.shrink(
            child: Text('date' * 1000),
          ),
          SizedBox.square(
            dimension: 200,
            child: Text("asd" * 100),
          ),
          Container(
            width: 300,
            height: 300,
            constraints: const BoxConstraints(maxWidth: 200, minWidth: 50),
            child: Text("aa" * 200),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(8),
            decoration: ProjectUtility.decoration,
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.amber,
    //shape: BoxShape.circle,
    border: Border.all(width: 5, color: Colors.black),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
          //shape: BoxShape.circle,
          border: Border.all(width: 5, color: Colors.black),
        );
}
