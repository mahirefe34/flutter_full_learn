import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_url.dart';

import 'package/launch_manager.dart';
import 'package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          LoadingBar(),
          LaunchUrl(
            url: 'https://www.google.com',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              Theme.of(context).buttonTheme.colorScheme?.onSecondary,
          onPressed: () {
            launchUrlStringWithMixin('https://www.google.com');
          }),
    );
  }
}
