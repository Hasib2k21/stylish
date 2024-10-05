import 'package:flutter/material.dart';
import 'package:stylish/presentation/ui/utils/all_featured_list.dart';

class AllFeaturedCard extends StatelessWidget {
  const AllFeaturedCard({
    super.key, required this.item,
  });
 final FeaturedItem item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  item.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}