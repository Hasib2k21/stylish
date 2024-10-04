import 'package:flutter/material.dart';
import 'package:stylish/presentation/ui/utils/app_colors.dart';
import 'package:stylish/presentation/ui/widget/app_logo.dart';
import 'package:stylish/presentation/ui/widget/home/section_header.dart';

import '../../widget/home/horizontal_category_product_list.dart';
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
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(
               width: 120,
               child: AppLogo())
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
              },
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/img_4.png'), // Profile image
              ),
            ),
          ),
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 5),
            SearchTextField(textEditingController: TextEditingController(),),
            SizedBox(height: 16,),
            _buildCategoryListView()
          ],
        ),
      ),
    );
  }
  Widget _buildCategoryListView() {
    return Column(
      children: [
        SectionHeader(
          title: 'All Featured',
          onTap: () {
          },
        ),
        const SizedBox(height: 5,),
        const SizedBox(
          height: 120,
          child: HorizontalAllFeaturedProductList(),
        ),
      ],
    );
  }
}




