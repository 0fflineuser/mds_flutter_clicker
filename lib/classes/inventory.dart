import 'package:flutter/foundation.dart';
import 'package:flutter_clicker/classes/product.dart';

class Inventory {
  List<Product> products = [];
  Inventory();

  void addProduct(Product product) {
    try {
      var produced =
          products.firstWhere((element) => element.name == product.name);
      produced.quantity += product.quantity;
    } catch (e) {
      products.add(Product.clone(product));
    }
  }

  void sortByName() {
    products.sort((a, b) => a.name.compareTo(b.name));
  }

  void sortByQuantity() {
    products.sort((a, b) => b.quantity.compareTo(a.quantity));
  }
}
