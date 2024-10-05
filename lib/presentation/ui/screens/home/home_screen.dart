import 'package:flutter/material.dart';
import 'package:stylish/presentation/ui/utils/app_colors.dart';
import 'package:stylish/presentation/ui/widget/app_logo.dart';
import 'package:stylish/presentation/ui/widget/home/home_banner_slider.dart';
import 'package:stylish/presentation/ui/widget/home/section_header.dart';

import '../../widget/home/horizontal_featured_product_list.dart';
import '../../widget/home/horizontal_product_list.dart';
import '../../widget/home/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 70,
            backgroundColor: AppColors.bgColor,
            elevation: 0,
            floating: true,
            snap: true,
            pinned: false,
            leading: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {}),
            title: const Center(child: SizedBox(width: 120, child: AppLogo())),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/img_4.png')),
                ),
              ),
            ],
          ),
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 5),
              SearchTextField(textEditingController: TextEditingController()),
              const SizedBox(height: 16),
              _buildCategoryListView(),
              const SizedBox(height: 12),
              const HomeBannerSlider(),
              const SizedBox(height: 12),
              _buildDealOfTheDay("Deal of the Day", "22h 55m 20s remaining",
                  () {}, const Color(0xFF4392F9), context),
              const SizedBox(height: 12),
              const HorizontalProductList(),
              const SizedBox(height: 12),
              _buildSpecialOfferBanner(),
              const SizedBox(height: 12),
              _buildFlatAndHeelBanner(),
              const SizedBox(height: 12),
              _buildDealOfTheDay("Trending Products", "Last Date 29/02/22",
                  () {}, const Color(0xFFFD6E87), context),
              const SizedBox(height: 12),
              const HorizontalProductList(),
              const SizedBox(height: 12),
              _buildNewArrivalsBanner(),
              const SizedBox(height: 12),
              _buildSponsoredBanner(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewArrivalsBanner() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Image.asset('assets/images/img_11.png', fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Arrival',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const Text('Summer 25 Collection'),
                  ],
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('View all')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlatAndHeelBanner() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Image.asset('assets/images/img_10.png'),
      ),
    );
  }

  Widget _buildSpecialOfferBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/img_9.png'),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Special Offers',
                  style: Theme.of(context).textTheme.bodyLarge),
              const Text(
                  'We make sure you get the\noffer you need at best prices'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryListView() {
    return Column(
      children: [
        SectionHeader(title: 'All Featured', onTap: () {}),
        const SizedBox(height: 16),
        const SizedBox(
          height: 120,
          child: HorizontalAllFeaturedProductList(),
        ),
      ],
    );
  }

  Widget _buildSponsoredBanner() {
    return Container(
      height: 340,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text('Sponsored', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset('assets/images/img_12.png', fit: BoxFit.fill),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('up to 50% Off',
                  style: Theme.of(context).textTheme.titleMedium),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildDealOfTheDay(
    String headText, String text, VoidCallback onTap, Color color, context) {
  return Container(
    padding: const EdgeInsets.all(8),
    height: 80,
    width: double.infinity,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(headText,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white)),
            const SizedBox(height: 6),
            Wrap(
              spacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(Icons.timer, color: Colors.white),
                Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white)),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 120,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2)),
            onPressed: onTap,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('View all'),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
