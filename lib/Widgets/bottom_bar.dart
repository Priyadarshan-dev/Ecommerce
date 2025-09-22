import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/Screens/catalog_screen.dart';
import 'package:ecommerce/Screens/favourite_screen.dart';
import 'package:ecommerce/Screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    CatalogScreen(),
    FavouriteScreen(),
    CartScreen(),
    OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: GNav(
            onTabChange: _navigateBottomBar,
            selectedIndex: _selectedIndex,
            tabBackgroundColor: const Color(0xFFF9F9F9),
            gap: 8,
            padding: const EdgeInsets.all(12),
            duration: const Duration(milliseconds: 300),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
                iconColor: Color(0xFF939393),
                textColor: Color(0xFF939393), // visible even if not selected
                // leading: Image.asset(
                //   "assets/images/home2.png",
                //   height: 24,
                //   width: 24,
                //   color: _selectedIndex == 0
                //       ? Color(0xFF4C4DDC)
                //       : Color(0xFF939393),
                // ),
              ),
              GButton(
                icon: Icons.calendar_today,
                text: "Favourites",
                iconColor: Color(0xFF939393),
                textColor: Color(0xFF939393),
                // leading: Image.asset(
                //   "assets/images/calendar.png",
                //   height: 24,
                //   width: 24,
                //   color: _selectedIndex == 1
                //       ? Color(0xFF4C4DDC)
                //       : Color(0xFF939393),
                // ),
              ),
              GButton(
                //icon: Icons.circle, // placeholder iconColor: Colors.transparent,
                icon: Icons.bookmark,
                text: "Cart",
                iconColor: Color(0xFF939393),
                textColor: Color(0xFF939393),
                // leading: Image.asset(
                //   "assets/images/bookmark.png",
                //   height: 24,
                //   width: 24,
                //   color: _selectedIndex == 2
                //       ? Color(0xFF4C4DDC)
                //       : Color(0xFF939393),
                // ),
              ),
              GButton(
                icon: Icons.person,
                text: "Orders",
                iconColor: Color(0xFF939393),
                textColor: Color(0xFF939393),
                // leading: Image.asset(
                //   "assets/images/profile.png",
                //   height: 24,
                //   width: 24,
                //   color: _selectedIndex == 3
                //       ? Color(0xFF4C4DDC)
                //       : Color(0xFF939393),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
