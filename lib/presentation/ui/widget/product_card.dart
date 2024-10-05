import 'package:flutter/material.dart';
import '../utils/app_constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 190,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 190,
            height: 124,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/img_8.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('HRX by Hrithik Roshan',
                    style: AppConstant.textStyle16Bold),
                Text(
                  'Neque porro quisquam est qui dolorem ipsum quia',
                  style: AppConstant.textStyle14Regular,
                ),
                const SizedBox(height: 8),
                Text('₹2499', style: AppConstant.textStyle16Bold),
                Row(
                  children: [
                    Text('₹4999', style: AppConstant.textStyle16LightGrey),
                    const SizedBox(width: 5),
                    const Text('50% Off', style: AppConstant.discountStyle),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.yellow),
                    const Icon(Icons.star, size: 16, color: Colors.yellow),
                    const Icon(Icons.star, size: 16, color: Colors.yellow),
                    const Icon(Icons.star, size: 16, color: Colors.yellow),
                    const Icon(Icons.star_half, size: 16, color: Colors.yellow),
                    const SizedBox(width: 5),
                    Text('344567', style: AppConstant.ratingStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
