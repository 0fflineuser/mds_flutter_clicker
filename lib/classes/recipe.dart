import 'package:flutter_clicker/classes/product.dart';
import 'package:flutter_clicker/classes/ressource.dart';

class Recipe {
  String name;
  List<Ressource> ingredientsRessources;
  List<Product> ingredientsProducts;
  Product produced;

  Recipe({
    required this.name,
    required this.ingredientsRessources,
    required this.ingredientsProducts,
    required this.produced,
  });
}
