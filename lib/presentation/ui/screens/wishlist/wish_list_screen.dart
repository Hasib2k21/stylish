import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
      ),
      //body: //ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products = [
    Product(
      imageUrl: 'https://via.placeholder.com/300x180',
      title: 'Black Winter...',
      description: 'Autumn And Winter Casual\ncotton-padded jacket...',
      price: '₹499',
      rating: 4.5,
      reviews: '6,890',
      isLarge: true,
    ),
    Product(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Mens Starry',
      description: 'Mens Starry Sky Printed Shirt\n100% Cotton Fabric',
      price: '₹399',
      rating: 4.0,
      reviews: '1,52,344',
      isLarge: false,
    ),
    Product(
      imageUrl: 'https://via.placeholder.com/300x180',
      title: 'Black Dress',
      description: 'Solid Black Dress for Women,\nSexy Chain Shorts Ladi...',
      price: '₹2,000',
      rating: 4.5,
      reviews: '5,23,456',
      isLarge: true,
    ),
    Product(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Pink Embroide...',
      description: 'EARTHEN Rose Pink\nEmbroidered Tiered Max...',
      price: '₹1,900',
      rating: 4.0,
      reviews: '45,678',
      isLarge: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView( // Make the grid scrollable
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
          shrinkWrap: true, // Ensure the grid takes only the necessary height
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageHeight = product.isLarge ? 180 : 120; // Large and small image heights

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              product.imageUrl,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: imageHeight + 100,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.description,
                  style: TextStyle(color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text('${product.rating}'),
                    const SizedBox(width: 5),
                    Text('(${product.reviews})'),
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

class Product {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final double rating;
  final String reviews;
  final bool isLarge;

  Product({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.isLarge,
  });
}
