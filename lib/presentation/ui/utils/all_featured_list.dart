class FeaturedItem {
  final String imageUrl;
  final String label;

  FeaturedItem({required this.imageUrl, required this.label});
}

final List<FeaturedItem> feature = [
  FeaturedItem(
    imageUrl:
    'https://th.bing.com/th?id=OIP.VTq96ys3hKPbPOkaL0kQNQAAAA&w=204&h=306&c=8&rs=1&qlt=90&r=0&o=6&pid=3.1&rm=2',
    label: 'Beauty',
  ),

  FeaturedItem(
    imageUrl:
    'https://th.bing.com/th?id=OIP.1RfKeDjiffAd7MnXDykgcQAAAA&w=285&h=219&c=8&rs=1&qlt=90&r=0&o=6&pid=3.1&rm=2',
    label: 'Fashion',
  ),
  FeaturedItem(
    imageUrl:
    'https://th.bing.com/th?id=OIP.ZjRNSnaY_gbOm1H8mtSJUwHaHa&w=250&h=250&c=8&rs=1&qlt=90&r=0&o=6&pid=3.1&rm=2',
    label: 'Kids',
  ),
  FeaturedItem(
    imageUrl:
    'http://ts4.mm.bing.net/th?id=OIP.FxwrviRZ3Acu-y1NJWRRigHaHa&pid=15.1',
    label: 'Mens',
  ),
  FeaturedItem(
    imageUrl:
    'http://ts4.mm.bing.net/th?id=OIP.FxwrviRZ3Acu-y1NJWRRigHaHa&pid=15.1',
    label: "Women's",
  ),
];