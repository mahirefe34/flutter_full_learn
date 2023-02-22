import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacitiy = false;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  void _changeVisiblity() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacitiy = !_isOpacitiy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisiblity();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                opacity: _isOpacitiy ? 1 : 0.1,
                duration: _DurationItems.durationLow,
                child: const Text('data')),
            trailing: IconButton(
                onPressed: _changeOpacity,
                icon: const Icon(Icons.precision_manufacturing_outlined)),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible
                    ? context.textTheme().headlineLarge
                    : context.textTheme().titleLarge) ??
                const TextStyle(),
            duration: _DurationItems.durationLow,
            child: const Text('data'),
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
          ),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: _isVisible
                ? (MediaQuery.of(context).size.height) * 0.2
                : (MediaQuery.of(context).size.width) * 0.2,
            width: _isVisible
                ? (MediaQuery.of(context).size.width) * 0.2
                : (MediaQuery.of(context).size.height) * 0.2,
            color: Colors.amber,
          ),
          Expanded(
              child: Stack(
            children: const [
              AnimatedPositioned(
                top: 30,
                curve: Curves.easeInCubic,
                duration: _DurationItems.durationLow,
                child: Text('data'),
              ),
            ],
          ))
        ],
      ),

      //_isVisible ? const Placeholder() : null,

      // Text('data', style: context.textTheme().bodyLarge),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
