import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            _buildRowWidget('Sort', CupertinoIcons.arrow_up_arrow_down, () {}),
            _buildRowWidget('Filter', Icons.filter_alt_outlined, () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildRowWidget(String text, icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40, // Set your desired height
        width: 90,
        child: Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(text),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
