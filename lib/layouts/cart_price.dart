import 'package:flutter/material.dart';
import 'package:loja_virutal_app/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPrice extends StatelessWidget {

  final VoidCallback buy;
  CartPrice(this.buy);

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
                Text('Resumo do Pedido', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal'),
                    Text('R\$ 81,35'),
                  ],
                ),
                Divider(),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Desconto'),
                    Text('R\$ 81,35'),
                  ],
                ),
                Divider(),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Entrega'),
                    Text('R\$ 81,35'),
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total'),
                    Text('R\$ 81,35'),
                  ],
                ),
                Divider(),
                RaisedButton(
                  child: Text(
                    'Finalizar Pedido', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: buy,
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