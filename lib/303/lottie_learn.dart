import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/constant/duration_items.dart';
import 'package:flutter_full_learn/product/constant/lottie_items.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});
  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  // bool isLight = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
    NavigateToHome();
  }

  Future<void> NavigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context)
        .pushReplacementNamed(NavigateRoutesEnum.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                animationController.animateTo(
                    context.read<ThemeNotifier>().isLightTheme ? 1 : 0.5);
                context.read<ThemeNotifier>().changeTheme();
                //animationController.animateTo(isLight? 0.5 : 1);
                //isLight = !isLight;
              },
              child: Lottie.asset(
                LottieItems.themeChange.lottiePath,
                repeat: false,
                controller: animationController,
                fit: BoxFit.cover,
              ))
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });

  final _loadingLottie =
      'https://assets2.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_loadingLottie),
    );
  }
}
