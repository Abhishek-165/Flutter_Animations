import 'package:flutter/material.dart';

class DialogAnimation extends StatefulWidget {
  const DialogAnimation({Key? key}) : super(key: key);

  @override
  State<DialogAnimation> createState() => _DialogAnimationState();
}

class _DialogAnimationState extends State<DialogAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> position;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    position = Tween<Offset>(begin: const Offset(0.0, -4.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: position,
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.blueAccent],
                )),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      Text(
                        "Animated Dialog",
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 1,
                          //height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
