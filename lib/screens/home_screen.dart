import 'package:flutter/material.dart';
import 'package:loja_virutal_app/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: PageController(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomeTab()
      ],
    );

  }
}
