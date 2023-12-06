import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "Cart"),
    );
  }
}