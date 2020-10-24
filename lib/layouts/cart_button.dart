import 'package:flutter/material.dart';
import 'package:loja_virutal_app/screens/carty_screen.dart';

class CartButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CartScreen())
        );
      },
      child: Icon(Icons.shopping_cart, color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}