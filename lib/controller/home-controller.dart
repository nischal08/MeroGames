import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merogames/screen/coin-screen.dart';
import 'package:merogames/screen/detail-screen.dart';
import 'package:merogames/screen/home-screen.dart';
import 'package:merogames/screen/realm-screen.dart';

class HomeController extends ChangeNotifier {
  int widgetIndex = 0;

  Map<String, IconData> categoryItems = {
    'Arcade': Icons.gamepad,
    'Racing': Icons.electric_bike_sharp,
    'Strategy': Icons.streetview_sharp,
    'More': Icons.more_horiz
  };

  onClickPopular(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
      ),
    );
  }

  // List<String> popularGame = [
  //   'https://i.ytimg.com/vi/7Eko7Bg6QUM/maxresdefault.jpg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjxWRuMYiJ7r9cixFF5CzcyGaiSxdcdBIL7g&usqp=CAU',
  //   'https://i.gadgets360cdn.com/large/pes-2020-messi_1564651246580.jpg?output-quality=80&output-format=webp',
  // ];
  //
  List screensList = [
    HomeScreen(),
    RealmScreen(),
    CoinScreen(),
  ];

  var bottomNavItemData = {
    Icon(Icons.home): 'Home',
    Icon(Icons.streetview_sharp): 'Realm',
    Icon(Icons.monetization_on): 'Coin',
  };

  int _bottomNavIndex = 0;
  // ignore: unnecessary_getters_setters
  int get bottomNavIndex => _bottomNavIndex;

  // ignore: unnecessary_getters_setters
  set bottomNavIndex(int value) => _bottomNavIndex = value;

  onBottomNavClick(int index) {
    widgetIndex = 0;

    bottomNavIndex = index;
    notifyListeners();
  }
}
