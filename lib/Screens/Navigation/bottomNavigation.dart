
import 'package:ace/Screens/HomePage/HomePageScreen.dart';
import 'package:ace/Screens/News/News.dart';
import 'package:ace/Screens/Shop/Shop.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Profile/ProfileScreen.dart';


class NavigationScreen extends StatefulWidget {

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final Screens = [HomePage(), NewsView(), ShopMerch(), ProfileScreen()];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_currentIndex],
      bottomNavigationBar:


      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(


          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),

          color: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.newspaper,
              text: 'News',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],

        ),
      ),
    );
  }
}

