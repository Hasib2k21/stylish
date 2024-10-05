import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/presentation/ui/utils/all_featured_list.dart';

import 'featured_card.dart';

class HorizontalAllFeaturedProductList extends StatelessWidget {
  const HorizontalAllFeaturedProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: feature.length,
      itemBuilder: (context, index) {
        final item = feature[index];
        return  AllFeaturedCard(item: item,);
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}