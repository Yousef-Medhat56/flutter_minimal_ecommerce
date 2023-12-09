import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:minimal_ecommerce_app/widgets/my_button.dart';
import 'package:provider/provider.dart';

import '../widgets/my_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text(
                  'Are you sure you want to remove this product from cart?'),
              actions: <Widget>[
                MaterialButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                MaterialButton(
                  child: const Text('Remove'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<Shop>().removeFromCart(product);
                  },
                ),
              ],
            ));
  }

  void handlePressPayBtn(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content:
                  Text("You're looking to pay! connect your backend payment."),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: const MyAppBar(title: "Cart"),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Your cart is empty"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            cart[index].name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            cart[index].price.toStringAsFixed(2),
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                          ),
                          trailing: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                removeFromCart(context, cart[index]);
                              }),
                        );
                      })),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MyButton(
                onTap: () => handlePressPayBtn(context),
                child: const Text("Pay now")),
          )
        ],
      ),
    );
  }
}
