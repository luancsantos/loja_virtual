import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja_virutal_app/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  
  final ProductData product;
  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductData product;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
       appBar: AppBar(
         title: Text(product.title),
         centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1.1,
            child: Carousel(
              images: product.images.map((e) {
                return NetworkImage(e);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title, 
                  style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "R\$ ${product.price}", 
                  style: TextStyle(fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  color: primaryColor
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}