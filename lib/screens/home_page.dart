import 'package:animations/screens/dialog_animation.dart';
import 'package:animations/screens/slide_in_transition.dart';
import 'package:animations/widgets/animation_card.dart';
import 'package:flutter/material.dart';

import 'tab_slider_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AnimationCard(
                title: "Dialog Animation",
                navigateTo: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DialogAnimation()));
                }),
            AnimationCard(
                title: "Slide Animation",
                navigateTo: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SlideInTransition()));
                }),
            AnimationCard(
                title: "Custom Tab Slider",
                navigateTo: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TabSliderAnimation()));
                })
          ],
        ),
      ),
    );
  }
}
