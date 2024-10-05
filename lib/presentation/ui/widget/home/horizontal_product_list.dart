import 'package:flutter/cupertino.dart';

import '../product_card.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Set the number of items to 10
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      ),
    );
  }
}