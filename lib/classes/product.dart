class Product {
  String name;
  int quantity;
  Product({required this.name, required this.quantity});
  static Product clone(Product product) {
    return Product(name: product.name, quantity: product.quantity);
  }
}
