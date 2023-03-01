import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const _paraf = "/";
  final items = {
    _paraf: (context) => const LottieLearn(),
    NavigateRoutesEnum.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutesEnum.homeDetail.withParaf: (context) =>
        const NavigateHomeDetailView(),
  };
}

enum NavigateRoutesEnum { init, home, homeDetail }

extension NavigateRoutesExtension on NavigateRoutesEnum {
  String get withParaf => "/$name";
}
