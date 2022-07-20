import 'package:flutter/material.dart';

class SlideInTransition extends StatefulWidget {
  const SlideInTransition({Key? key}) : super(key: key);

  @override
  State<SlideInTransition> createState() => _SlideInTransitionState();
}

class _SlideInTransitionState extends State<SlideInTransition>
    with TickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation animation;
  @override
  void initState() {
    Duration duration = const Duration(seconds: 1);

    animatedController = AnimationController(vsync: this, duration: duration);
    animation = Tween(begin: -1.0, end: 0).animate(
        CurvedAnimation(parent: animatedController, curve: Curves.easeIn));
    animatedController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: animatedController,
            builder: (context, child) => Transform(
              transform:
                  Matrix4.translationValues(animation.value * width, 0.0, 0.0),
              child: const Text("Slide Transition"),
            ),
          ),
        ),
      ),
    );
  }
}
