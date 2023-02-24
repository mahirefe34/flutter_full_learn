import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/theme/light_theme.dart';

import '202/cache/secure_context/secure_context_learn.dart';

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
      theme: LightTheme().theme,

      // ThemeData.dark().copyWith(
      //   tabBarTheme: const TabBarTheme(
      //     indicatorColor: Colors.red,
      //     unselectedLabelColor: Colors.pink,
      //     labelColor: Colors.white54,
      //     indicatorSize: TabBarIndicatorSize.label,
      //   ),
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     systemOverlayStyle: SystemUiOverlayStyle
      //         .light, //saat ve wifi gibi işaretlerin tema rengi
      //   ),
      //   progressIndicatorTheme:
      //       const ProgressIndicatorThemeData(color: Colors.white),
      // ),

      home: const SecureContextLearn(),
    );
  }
}
