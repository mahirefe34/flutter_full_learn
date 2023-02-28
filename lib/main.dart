import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/constant/project_items.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/widget/card/generic_user_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<ResourceContext>(
        create: (_) => ResourceContext(),
      ),
      ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier())
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ProjectItems.projectName,
        debugShowCheckedModeBanner: false,
        //theme: ThemeData.light(),
        theme:
            context.watch<ThemeNotifier>().currentTheme, // LightTheme().theme,

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

        home: GenericUserCard(
          model: GenericUser('MBE', '1', 1),
        ));
  }
}
