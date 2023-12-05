import 'package:flutter/material.dart';
import 'package:flutter_clicker/classes/product.dart';
import 'package:flutter_clicker/classes/recipe.dart';
import 'package:flutter_clicker/classes/ressource.dart';
import 'package:flutter_clicker/state/state_game.dart';
import 'package:provider/provider.dart';

class WidgetRecipe extends StatelessWidget {
  final Recipe recipe;
  const WidgetRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    var stateGame = Provider.of<StateGame>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UnconstrainedBox(
        child: Container(
          width: 400,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white, fontSize: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(recipe.name),
                  Column(
                    children: [
                      for (var entry in recipe.ingredientsRessources)
                        Text(
                            "${stateGame.playerRessources.firstWhere((el) => el.name == entry.name, orElse: () => Ressource(name: "", quantity: 0)).quantity} / ${entry.quantity} ${entry.name}"),
                    ],
                  ),
                  Column(
                    children: [
                      for (var entry in recipe.ingredientsProducts)
                        Text(
                            "${stateGame.playerInventory.products.firstWhere((el) => el.name == entry.name, orElse: () => Product(name: "", quantity: 0)).quantity} / ${entry.quantity} ${entry.name}"),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        stateGame.produceRecipe(recipe);
                      },
                      child: const Text("Produire"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
