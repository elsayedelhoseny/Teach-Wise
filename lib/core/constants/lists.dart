import 'package:clean_arch_flutter/c.dart';
import 'package:clean_arch_flutter/features/Home/presentation/views/home_screen.dart';
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

class CustomTab {
  final String title;
  final Widget screen;

  const CustomTab({required this.title, required this.screen});
}

final List<CustomTab> tabs = [
  CustomTab(title: 'تسجيل الدخول', screen: LoginScrsseen()),
  CustomTab(title: 'التسجيل', screen: HomeScreen()),
];
