import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_card.dart';

class HorizontalAllFeaturedProductList extends StatelessWidget {
  const HorizontalAllFeaturedProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const AllFeaturedCard(imageUrl: 'assets/images/img_4.png', label: 'Beauty',
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}