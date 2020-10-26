import 'package:flutter/material.dart';
import 'package:loja_virutal_app/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPrice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Resumo do Pedido'),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Subtotal'),
                    SizedBox(width: 240.0,),
                    Text('R\$ 81,35'),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Desconto'),
                    SizedBox(width: 240.0,),
                    Text('R\$ 81,35'),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Text('Entrega'),
                    SizedBox(width: 240.0,),
                    Text('R\$ 81,35'),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text('Total'),
                    SizedBox(width: 240.0,),
                    Text('R\$ 81,35'),
                  ],
                ),
                RaisedButton(
                  child: Text(
                    'Finalizar Pedido', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (){

                  },
                  color: Theme.of(context).primaryColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}