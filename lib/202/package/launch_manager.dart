import 'package:url_launcher/url_launcher_string.dart';

mixin LaunchMixin {
  void launchUrlStringWithMixin(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}
