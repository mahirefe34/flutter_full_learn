import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';

import '../../303/navigator/navigate_home_view.dart';

mixin NavigatorCustom on Widget {
  static const _paraf = "/";

  Route<dynamic>? onGenerareRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const LottieLearn());
    }

    final routes = routeSettings.name == NavigatorCustom._paraf
        ? NavigateCustomEnum.init
        : NavigateCustomEnum.values.byName(
            routeSettings.name!.substring(1),
          );

    switch (routes) {
      case NavigateCustomEnum.init:
        return _navigateToNormal(const LottieLearn());

      case NavigateCustomEnum.home:
        return _navigateToNormal(const NavigateHomeView());

      case NavigateCustomEnum.homeDetail:
        final id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetailView(
              id: id is String ? id : null,
            ),
            isFullScreenDialog: true);
    }

    /* if (routeSettings.name == _paraf) {
      return _navigateToNormal(const LottieLearn());
    } else if (routeSettings.name == NavigateCustomEnum.home.withParaf) {
      return _navigateToNormal(const NavigateHomeView());
    } else if (routeSettings.name == NavigateCustomEnum.homeDetail.withParaf) {
      final id = routeSettings.arguments;
      return _navigateToNormal(NavigateHomeDetailView(
        id: id is String ? id : null,
      ));
    }
    return null; */
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) {
        return child;
      },
    );
  }
}

enum NavigateCustomEnum { init, home, homeDetail }

extension NavigateCustomExtension on NavigateCustomEnum {
  String get withParaf => "/$name";
}
