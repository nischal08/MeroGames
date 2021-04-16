import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:merogames/constants/constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: kBorderTextFieldkCardkSearchbar,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 50,
      child: TextField(
        showCursor: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          hintText: "Search Games...",
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Theme.of(context).primaryColor),
          suffixIcon: Icon(
            Icons.search,
            size: 22,
            color: Theme.of(context).primaryColor,
          ),
          filled: true,
          fillColor: Colors.white,
          enabled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
