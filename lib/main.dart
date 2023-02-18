import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '101/text_field_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light()
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle
                .light, //saat ve wifi gibi işaretlerin tema rengi
          ),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white)),
      home: const TextFieldLearn(),
    );
  }
}
