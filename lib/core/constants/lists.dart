import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Login/manger/login_cubit.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Login/views/login_view_body.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Register/manger/register_cubit.dart';
import 'package:clean_arch_flutter/parent_layout/features/auth/presentation/Auth/presentation/Register/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  CustomTab(
      title: 'تسجيل الدخول',
      screen: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginViewBody(),
      )),
  CustomTab(
      title: 'التسجيل',
      screen: BlocProvider(
        create: (context) => RegisterCubit(),
        child: RegisterViewBody(),
      )),
];
