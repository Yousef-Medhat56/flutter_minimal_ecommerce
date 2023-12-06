import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/widgets/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //LOGO
              Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 32),
                  child: Icon(
                    Icons.shopping_bag,
                    size: 56,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
              // SHOP TILE
              MyListTile(
                  title: "Shop",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                  }),
              // CART TILE
              MyListTile(
                  title: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/cart_page");
                  }),
            ],
          ),

          // EXIT
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MyListTile(
                title: "Exit",
                icon: Icons.logout,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/intro_page", (route) => false);
                }),
          ),
        ],
      ),
    );
  }
}
