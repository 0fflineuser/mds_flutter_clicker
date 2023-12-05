import 'package:flutter_clicker/classes/product.dart';

class Building extends Product {
  int productionRate; // Quantity produced per second

  Building(
      {required super.name,
      required super.quantity,
      required this.productionRate});
}
