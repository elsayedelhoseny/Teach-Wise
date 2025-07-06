import 'package:flutter/material.dart';

class DrawerListItem {
  final String imagePath;
  final String name;
  final Widget page;

  DrawerListItem(
      {required this.imagePath, required this.name, required this.page});
}

class ListItems {
  final String imagePath;
  final String name;
  final Widget page;
  final Color colors;

  ListItems(
      {required this.colors,
      required this.imagePath,
      required this.name,
      required this.page});
}
