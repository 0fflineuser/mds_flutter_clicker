import 'package:flutter/material.dart';

class Ressource {
  String name;
  int quantity;
  late int quantitySinceBeginning;
  bool isLocked;
  Color color;

  Ressource(
      {required this.name,
      required this.quantity,
      this.isLocked = true,
      this.color = Colors.purple}) {
    quantitySinceBeginning = quantity;
  }

  void mine({int step = 1}) {
    quantity += step;
    quantitySinceBeginning += step;
  }
}
