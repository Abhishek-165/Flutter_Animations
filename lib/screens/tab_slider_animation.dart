import 'package:flutter/material.dart';

class TabSliderAnimation extends StatefulWidget {
  const TabSliderAnimation({Key? key}) : super(key: key);

  @override
  State<TabSliderAnimation> createState() => _TabSliderAnimationState();
}

class _TabSliderAnimationState extends State<TabSliderAnimation> {
  List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  int pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  List<String> pageTitle = ["First", " Second", "Third"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                pageTitle.length,
                (index) => Container(
                      margin: const EdgeInsets.only(left: 8.0, top: 20),
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                          onTap: () {
                            _onItemTapped(index);
                          },
                          child: Text(
                            pageTitle[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                    )),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => pageIndex = index);
              },
              children: pages,
            ),
          ),
        ],
      )),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("First Page"),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Second Page"),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Third Page"),
      ),
    );
  }
}
