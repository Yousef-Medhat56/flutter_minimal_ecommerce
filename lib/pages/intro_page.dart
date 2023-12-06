import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/widgets/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // LOGO
          Icon(
            Icons.shopping_bag,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 24),
          // TITLE
          const Text(
            "Minimal Shop",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8),
          // SUBTITLE
          Text(
            "Premium quality products",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(height: 24),
          // BUTTON
          MyButton(
              child: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushNamed(context, "/shop_page");
              })
        ],
      )),
    );
  }
}
