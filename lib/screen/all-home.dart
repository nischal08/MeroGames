import 'package:flutter/material.dart';
import 'package:merogames/constants/constants.dart';
import 'package:merogames/controller/home-controller.dart';
import 'package:provider/provider.dart';

class AllHome extends StatelessWidget {
  HomeController _homeStateController;
  @override
  Widget build(BuildContext context) {
    _homeStateController = Provider.of<HomeController>(context);

    return Scaffold(
      body: _homeStateController.screensList[_homeStateController.bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _homeStateController.bottomNavIndex,
        items: [
          for (var key in _homeStateController.bottomNavItemData.keys)
            BottomNavigationBarItem(
              icon: key,
              label: _homeStateController.bottomNavItemData[key],
            ),
        ],
        selectedItemColor: lightRed,
        unselectedItemColor: lightBrown,
        onTap: _homeStateController.onBottomNavClick,
      ),
    );
  }
}
