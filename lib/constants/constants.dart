import 'package:flutter/material.dart';

Border kBorderTextFieldkCardkSearchbar = Border.all(
  width: 0.25,
  color: Colors.grey,
);

  Color lightBrown = Color(0xffCCBBBB);
  Color red = Color(0xffE31C1B);
  Color lightRed = Colors.red[400];
  Color backgroundScaffold = Color(0xffF9FFFFFF);
  Color darkBrown = Color(0xff443734);
  Color darkRed = Color(0xffBD4020);
  Color yellow = Color(0xffEC983B);
  Color backgroundColor = Color(0xff717E8A);
  Color lightGrey = Colors.grey[500];
  Color unselectedColor = Colors.black;
Color colorRating = Colors.amber;
Color colorBlackFont = Colors.black;
Color colorGreyFont = Colors.grey;

final InputDecoration kTfBorder = InputDecoration(
  labelText: "Enter your value",
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigoAccent, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
