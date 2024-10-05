import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/presentation/ui/screens/cart/cart_screen.dart';
import 'package:stylish/presentation/ui/screens/search/search_screen.dart';
import 'package:stylish/presentation/ui/screens/settings/setting_screen.dart';
import 'package:stylish/presentation/ui/screens/wishlist/wish_list_screen.dart';

import '../../state_holders/bottom_navbar_controller.dart';
import 'home/home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavbarController _navbarController =
  Get.find<BottomNavbarController>();

  final List<Widget> _screen = [
    HomeScreen(),
    const WishListScreen(),
    const CartScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _screen[_navbarController.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(Icons.shopping_cart),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _navbarController.selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          onTap: _navbarController.changeIndex,
        ),
      );
    });
  }
}