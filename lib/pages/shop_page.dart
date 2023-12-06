import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/widgets/my_app_bar.dart';
import 'package:minimal_ecommerce_app/widgets/my_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "Shop"),
      drawer: MyDrawer(),
    );
  }
}
