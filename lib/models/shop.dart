import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 99,
      description: 'Item description',
    ),
    Product(
      name: 'Product 2',
      price: 99,
      description: 'Item description',
    ),
    Product(
      name: 'Product 3',
      price: 99,
      description: 'Item description',
    ),
    Product(
      name: 'Product 4',
      price: 99,
      description: 'Item description',
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
