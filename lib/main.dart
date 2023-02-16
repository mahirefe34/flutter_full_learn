import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '101/appBar_view.dart';
import '101/color_learn.dart';
import '101/icon_learn.dart';
import '101/stateless_learn.dart';

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
      ),
      home: const StatelessLearn(),
    );
  }
}
