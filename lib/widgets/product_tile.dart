import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Add to Cart"),
                content: const Text(
                    "Are you sure you want to add this product to cart?"),
                actions: [
                  MaterialButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Cancel")),
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.read<Shop>().addToCart(product);
                      },
                      child: const Text("Add"))
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(24),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(24),
                    width: double.infinity,
                    child: Image.asset(product.imageSrc)),
              ),

              const SizedBox(
                height: 24,
              ),
              //product name
              Text(
                product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              //product description
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price.toStringAsFixed(2)}"),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () {
                        addToCart(context);
                      },
                      icon: const Icon(Icons.add)))
            ],
          )
        ],
      ),
    );
  }
}
