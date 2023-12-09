import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:minimal_ecommerce_app/widgets/my_app_bar.dart';
import 'package:minimal_ecommerce_app/widgets/my_drawer.dart';
import 'package:minimal_ecommerce_app/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: MyAppBar(
        title: "Shop",
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart_page"),
              icon: Badge.count(
                  count: cart.length,
                  backgroundColor: Colors.red.shade700,
                  child: const Icon(Icons.shopping_cart_outlined)))
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          Center(
              child: Text(
            "Pick from a selected list of premium products",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
