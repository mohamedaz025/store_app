import 'package:flutter/material.dart';
import 'package:store_app/model/item.dart';

class Cared with ChangeNotifier {
  List selectedproducts = [];
  double price = 0;
  add(Item product) {
    selectedproducts.add(product);
    price += product.price.round();
    // لعمل ريف ريش بعد الفونكشون
    notifyListeners();
  }

  delete(Item product) {
    selectedproducts.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}
