import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  //products list
  final List<Product> _shop = [
    Product(
        name: "Product 1",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
        price: 99.99,
        imageSrc: "assets/1.png"),
    Product(
        name: "Product 2",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
        price: 69.99,
        imageSrc: "assets/2.png"),
    Product(
        name: "Product 3",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
        price: 50.99,
        imageSrc: "assets/3.png"),
    Product(
        name: "Product 4",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
        price: 150.00,
        imageSrc: "assets/4.png"),
  ];

  //the user cart
  final List<Product> _cart = [];

  //get shop products
  List<Product> get shop => _shop;

  //get user shopping cart
  List<Product> get cart => _cart;

  //add item to the cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
