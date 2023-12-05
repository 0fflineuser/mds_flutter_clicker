import 'package:flutter/material.dart';
import 'package:flutter_clicker/classes/inventory.dart';
import 'package:flutter_clicker/classes/product.dart';
import 'package:flutter_clicker/classes/recipe.dart';
import 'package:flutter_clicker/classes/ressource.dart';
import 'package:flutter_clicker/constants.dart';

class StateGame extends ChangeNotifier {
  late List<Ressource> playerRessources = [];
  List<Recipe> playerRecipes = [];
  Inventory playerInventory = Inventory();

  StateGame() {
    playerRessources.add(Ressource(
        name: "Bois",
        quantity: 0,
        isLocked: false,
        color: const Color(0xFF967969)));
    playerRessources.add(Ressource(
        name: "Minerai de fer",
        quantity: 0,
        isLocked: false,
        color: const Color(0xFFced4da)));
    playerRessources.add(Ressource(
        name: "Minerai de cuivre",
        quantity: 0,
        isLocked: false,
        color: const Color(0xFFd9480f)));
    playerRessources.add(Ressource(
        name: "Charbon",
        quantity: 0,
        isLocked: true,
        color: const Color(0xFF000000)));

    playerRecipes.add(Recipe(
      name: "Hache",
      ingredientsRessources: [
        Ressource(name: "Bois", quantity: 2),
      ],
      ingredientsProducts: [Product(name: "Tige en métal", quantity: 2)],
      produced: Product(name: "Hache", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Pioche",
      ingredientsRessources: [
        Ressource(name: "Bois", quantity: 2),
      ],
      ingredientsProducts: [Product(name: "Tige en métal", quantity: 2)],
      produced: Product(name: "Pioche", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Lingot de fer",
      ingredientsRessources: [Ressource(name: "Minerai de fer", quantity: 1)],
      ingredientsProducts: [],
      produced: Product(name: "Lingot de fer", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Plaque de fer",
      ingredientsRessources: [Ressource(name: "Minerai de fer", quantity: 3)],
      ingredientsProducts: [],
      produced: Product(name: "Plaque de fer", quantity: 2),
    ));
    playerRecipes.add(Recipe(
      name: "Lingot de cuivre",
      ingredientsRessources: [
        Ressource(name: "Minerai de cuivre", quantity: 1)
      ],
      ingredientsProducts: [],
      produced: Product(name: "Lingot de cuivre", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Tige en métal",
      ingredientsRessources: [],
      ingredientsProducts: [Product(name: "Lingot de fer", quantity: 1)],
      produced: Product(name: "Tige en métal", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Fil électrique",
      ingredientsRessources: [],
      ingredientsProducts: [Product(name: "Lingot de cuivre", quantity: 1)],
      produced: Product(name: "Fil électrique", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Mineur",
      ingredientsRessources: [],
      ingredientsProducts: [
        Product(name: "Plaque de fer", quantity: 10),
        Product(name: "Fil électrique", quantity: 5)
      ],
      produced: Product(name: "Mineur", quantity: 1),
    ));
    playerRecipes.add(Recipe(
      name: "Fonderie",
      ingredientsRessources: [],
      ingredientsProducts: [
        Product(name: "Fil électrique", quantity: 5),
        Product(name: "Tige en métal", quantity: 8)
      ],
      produced: Product(name: "Fonderie", quantity: 1),
    ));
  }

  void sortInventoryByName() {
    playerInventory.sortByName();
    notifyListeners();
  }

  void sortInventoryByQuantity() {
    playerInventory.sortByQuantity();
    notifyListeners();
  }

  void produceRecipe(Recipe recipe) {
    try {
      var ingredientsRessources = recipe.ingredientsRessources;
      var ingredientsProducts = recipe.ingredientsProducts;
      /* validate that we have enough ressources */
      for (var ingredient in ingredientsRessources) {
        var playerRessource = playerRessources
            .firstWhere((element) => element.name == ingredient.name);
        if (playerRessource.quantity < ingredient.quantity) {
          throw Exception("Not enought ${ingredient.name}.");
        }
      }
      /* validate that the player has enought products in it's inventory */
      for (var ingredient in ingredientsProducts) {
        var playerProduct = playerInventory.products
            .firstWhere((element) => element.name == ingredient.name);
        if (playerProduct.quantity < ingredient.quantity) {
          throw Exception("Not enought ${ingredient.name}.");
        }
      }

      /* remove quantity from player ressource */
      for (var ingredient in ingredientsRessources) {
        var playerRessource = playerRessources
            .firstWhere((element) => element.name == ingredient.name);
        playerRessource.quantity -= ingredient.quantity;
      }
      /* remove quantity from player product */
      for (var ingredient in ingredientsProducts) {
        var playerProduct = playerInventory.products
            .firstWhere((element) => element.name == ingredient.name);
        playerProduct.quantity -= ingredient.quantity;
      }

      /* add the product to the inventory */
      playerInventory.addProduct(recipe.produced);
      notifyListeners();
    } catch (e) {
      debugPrint("error - produceRecipe - $e");
    }
  }

  void mineRessource(Ressource ressource) {
    try {
      final minedRessource = playerRessources
          .firstWhere((element) => element.name == ressource.name);
      minedRessource.mine(step: miningStep);
      _unlockRessources();

      notifyListeners();
    } catch (e) {
      debugPrint("error - mineRessource - $e");
    }
  }

  void _unlockRessources() {
    /* unlock coal when mined at least 1000 of wood and copper */
    final coalRessource =
        playerRessources.firstWhere((element) => element.name == "Charbon");
    if (coalRessource.isLocked == true) {
      final ironRessource = playerRessources
          .firstWhere((element) => element.name == "Minerai de fer");
      final copperRessource = playerRessources
          .firstWhere((element) => element.name == "Minerai de cuivre");
      if (ironRessource.quantitySinceBeginning >= 1000 &&
          copperRessource.quantitySinceBeginning >= 1000) {
        coalRessource.isLocked = false;
      }
    }
  }
}
