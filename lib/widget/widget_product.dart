import 'package:flutter/material.dart';
import 'package:flutter_clicker/classes/product.dart';

class WidgetProduct extends StatelessWidget {
  final Product product;
  const WidgetProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UnconstrainedBox(
        child: Container(
          width: 400,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white, fontSize: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${product.quantity} ${product.name}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
