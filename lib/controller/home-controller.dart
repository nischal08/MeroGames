import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  Map<String, IconData> categoryItems = {
    'Arcade': Icons.gamepad,
    'Racing': Icons.electric_bike_sharp,
    'Strategy': Icons.streetview_sharp,
    'More': Icons.more_horiz
  };

  List<String> popularGame = [
    'https://i.ytimg.com/vi/7Eko7Bg6QUM/maxresdefault.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjxWRuMYiJ7r9cixFF5CzcyGaiSxdcdBIL7g&usqp=CAU',
    'https://i.gadgets360cdn.com/large/pes-2020-messi_1564651246580.jpg?output-quality=80&output-format=webp',
  ];
}
