import 'package:ecommerce/Screens/cart_screen.dart';
import 'package:ecommerce/Screens/catalog_screen.dart';
import 'package:ecommerce/Screens/favourite_screen.dart';
import 'package:ecommerce/Screens/orders_screen.dart';
import 'package:ecommerce/Screens/profile_screen.dart';
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
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
          color: Colors.white, // White background
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: GNav(
            onTabChange: _navigateBottomBar,
            selectedIndex: _selectedIndex,
            tabBackgroundColor: Colors.grey.shade200,
            gap: 8,
            padding: const EdgeInsets.all(12),
            duration: const Duration(milliseconds: 300),
            color: Colors.grey.shade600,
            activeColor: Colors.black,

            tabs: [
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                text: "Home",
                textColor: Colors.black,
                leading: Image.asset(
                  "assets/images/home.png",
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 0
                      ? Colors.black
                      : Colors.grey.shade600,
                ),
              ),
              GButton(
                text: "Favourites",
                icon: Icons.circle,
                iconColor: Colors.transparent,
                textColor: Colors.black,
                leading: Image.asset(
                  "assets/images/heart1.png",
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 1
                      ? Colors.black
                      : Colors.grey.shade600,
                ),
              ),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                text: "Cart",
                textColor: Colors.black,
                leading: Image.asset(
                  "assets/images/cart.png",
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 2
                      ? Colors.black
                      : Colors.grey.shade600,
                ),
              ),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                text: "Orders",
                textColor: Colors.black,
                leading: Image.asset(
                  "assets/images/history.png",
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 3
                      ? Colors.black
                      : Colors.grey.shade600,
                ),
              ),
              GButton(
                icon: Icons.circle,
                iconColor: Colors.transparent,
                text: "Account",
                textColor: Colors.black,
                leading: Image.asset(
                  "assets/images/user.png",
                  height: 24,
                  width: 24,
                  color: _selectedIndex == 4
                      ? Colors.black
                      : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
