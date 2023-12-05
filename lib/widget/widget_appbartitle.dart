import 'package:flutter/material.dart';
import 'package:flutter_clicker/page/page_inventory.dart';
import 'package:flutter_clicker/page/page_recipes.dart';

class WidgetAppBarTitle extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const WidgetAppBarTitle(
      {super.key, required this.title, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Tooltip(
          message: 'Recettes',
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageRecipes()));
              },
              child: const Icon(Icons.list)),
        ),
        Tooltip(
          message: 'Inventaire',
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PageInventory()));
              },
              child: const Icon(Icons.inventory)),
        ),
        ...children
      ],
    );
  }
}
