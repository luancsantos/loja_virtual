import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: PageController(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(color: Colors.red,),
        Container(color: Colors.green,)
      ],
    );

  }
}
