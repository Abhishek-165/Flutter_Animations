import 'dart:math';

import 'package:flutter/material.dart';

class FadeInSlider extends StatefulWidget {
  const FadeInSlider({Key? key}) : super(key: key);

  @override
  State<FadeInSlider> createState() => _FadeInSliderState();
}

class _FadeInSliderState extends State<FadeInSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool init = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));

    controller.forward(from: 0.2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget wrapInAnimation(Widget child, int index) {
    Animation<double> offsetAnimation =
        CurvedAnimation(parent: controller, curve: IndexOffsetCurve(index));
    Animation<double> fade =
        CurvedAnimation(parent: offsetAnimation, curve: Curves.ease);
    return SlideTransition(
        position: Tween<Offset>(
                begin: const Offset(0.5, 0.0), end: const Offset(0.0, 0.0))
            .animate(fade),
        child: FadeTransition(
          opacity: fade,
          child: child,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            wrapInAnimation(
                const PreviewCard(
                    title: "Fruits",
                    data: ["Apple", "Mango", "Banana", "JackFruit"]),
                1),
            wrapInAnimation(
                const PreviewCard(
                  title: "Vegetables",
                  data: ["Cucumber", "Greeen Vegi", "Potato", "Tomato"],
                ),
                2)
          ]))
        ],
      ),
    ));
  }
}

class IndexOffsetCurve extends Curve {
  const IndexOffsetCurve(this.index);

  final int index;

  @override
  double transform(double t) {
    return pow(t, (index + 1) * 2).toDouble();
  }
}

class PreviewCard extends StatelessWidget {
  const PreviewCard({required this.title, required this.data, Key? key})
      : super(key: key);
  final List<String> data;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: data
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
