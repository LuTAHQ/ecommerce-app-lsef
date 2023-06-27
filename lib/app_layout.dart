import 'package:fakestore_app/views/cart_screen.dart';
import 'package:fakestore_app/views/favorites_screen.dart';
import 'package:fakestore_app/views/main_screen.dart';
import 'package:fakestore_app/views/profile_screen.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedIndex = 0;
  bool isChecked = false;

  static final List<Widget> _widgetOptions = <Widget>[
    const MainScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/home_.png'), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/favourite.png'),
              label: "Favorites"),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/system-uicons_cart.png'),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile.png'), label: "Profile"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
