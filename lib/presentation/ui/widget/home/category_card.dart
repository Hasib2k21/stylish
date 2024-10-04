import 'package:flutter/material.dart';

class AllFeaturedCard extends StatelessWidget {
  final String imageUrl;
  final String label;

  const AllFeaturedCard({
    super.key,
    required this.imageUrl,
    required this.label,
  });

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
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}