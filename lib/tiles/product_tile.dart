import 'package:flutter/material.dart';
import 'package:loja_virutal_app/datas/product_data.dart';

class ProductTile extends StatelessWidget {

  final String type;
  final ProductData data;

  ProductTile(this.type, this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          child: type == 'grid' ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(
                    data.images[0],
                    fit: BoxFit.cover,
                  ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(data.title,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text( data.price.toStringAsFixed(2),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
              )
            ],
          )
          : Row(),
        )
    );
  }
}
