import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virutal_app/datas/product_data.dart';

class CartProduct {

  String cid;
  String category;
  String pid;
  String size;

  int quantity;

  ProductData productData;

  CartProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data['category'];
    pid = document.data['pid'];
    size = document.data['size'];
    quantity = document.data['quantity'];
  }

  Map<String, dynamic> toMap(){
    return {
      "category" : category,
      "pid" : pid,
      "size" : size,
      "quantity" : quantity,
      "product": productData.toResumeMap()
    };
  }
  
}