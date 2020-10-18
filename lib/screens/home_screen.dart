import 'package:flutter/material.dart';
import 'package:loja_virutal_app/layouts/custom_drawer.dart';
import 'package:loja_virutal_app/tabs/home_tab.dart';
import 'package:loja_virutal_app/tabs/products_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Nossos Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        )
      ],
    );
  }
}