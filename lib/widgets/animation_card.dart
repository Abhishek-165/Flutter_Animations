import 'package:flutter/material.dart';

class AnimationCard extends StatelessWidget {
  const AnimationCard({required this.title, required this.navigateTo, Key? key})
      : super(key: key);
  final String title;
  final VoidCallback navigateTo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: navigateTo,
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
