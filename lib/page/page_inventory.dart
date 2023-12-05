import 'package:flutter/material.dart';
import 'package:flutter_clicker/constants.dart';
import 'package:flutter_clicker/state/state_game.dart';
import 'package:flutter_clicker/widget/widget_appbartitle.dart';
import 'package:flutter_clicker/widget/widget_product.dart';
import 'package:provider/provider.dart';

class PageInventory extends StatelessWidget {
  const PageInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: WidgetAppBarTitle(title: pageTitleInventory, children: [
          ElevatedButton(
              onPressed: () {
                Provider.of<StateGame>(context, listen: false)
                    .sortInventoryByName();
              },
              child: const Text("Trier par nom")),
          ElevatedButton(
              onPressed: () {
                Provider.of<StateGame>(context, listen: false)
                    .sortInventoryByQuantity();
              },
              child: const Text("Trier par quantité")),
        ])),
        body: ListView(children: <Widget>[
          for (var product
              in Provider.of<StateGame>(context).playerInventory.products)
            if (product.quantity > 0) WidgetProduct(product: product)
        ]));
  }
}
