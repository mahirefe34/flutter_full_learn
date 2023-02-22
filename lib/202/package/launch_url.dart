import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl extends StatelessWidget {
  const LaunchUrl({super.key, this.widget, this.url});
  final Widget? widget;
  final String? url;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => _launchUrl(url!), child: widget);
  }
}
