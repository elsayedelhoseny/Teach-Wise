import 'dart:math';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/default_appbar.dart';
import 'package:clean_arch_flutter/core/widgets/default_no_Internet.dart';
import 'package:clean_arch_flutter/core/widgets/navigate_finish.dart';
import 'package:clean_arch_flutter/parent_layout/features/drawer/presentation/manger/drawer_cubit.dart';
import 'package:clean_arch_flutter/parent_layout/features/drawer/presentation/views/drawer_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ScrollController controller = ScrollController();

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.drawer,
    this.isHome = false,
    this.isProfile = false,
    this.isProductDetalis = false,
    this.screenTitle,
    this.actionIconPath,
    this.showAppBar = true,
    this.onTap,
    this.navigateBackTo,
    this.color,
    this.onRefresh,
    this.imageName,
  });
  final bool isProductDetalis;
  final Widget body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool isHome;
  final bool isProfile;
  final String? screenTitle;
  final String? imageName;
  final String? actionIconPath;
  final Function()? onTap;
  final Widget? navigateBackTo;
  final Color? color;
  final Future<void> Function()? onRefresh;
  final bool showAppBar;

  showExitConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          getLocalizedText().doyouwanttoexit,
        ),
        content: Text(
          getLocalizedText().areyousure,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              getLocalizedText().no,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              getLocalizedText().yes,
            ),
            onPressed: () {
              Future.delayed(const Duration(milliseconds: 200), () {
                SystemNavigator.pop();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        if (navigateBackTo != null) {
          navigateAndFinish(context, navigateBackTo);
        } else {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            await showExitConfirmationDialog(context);
          }
        }
      },
      child: BlocProvider(
        create: (context) => DrawerCubit(),
        child: RefreshIndicator(
            onRefresh: onRefresh ?? () async {},
            child: StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final connectivityResult = snapshot.data;
                  if (connectivityResult == ConnectivityResult.none) {
                    return noInternet(context);
                  }
                }
                return ScaffoldWidget(
                  imageName: imageName,
                  isProductDetalis: isProductDetalis,
                  showAppBar: showAppBar,
                  isHome: isHome,
                  isProfile: isProfile,
                  screenTitle: screenTitle,
                  actionIconPath: actionIconPath,
                  navigateBackTo: navigateBackTo,
                  color: color,
                  body: body,
                );
              },
            )),
      ),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
    required this.showAppBar,
    required this.isHome,
    required this.isProfile,
    required this.screenTitle,
    required this.actionIconPath,
    required this.navigateBackTo,
    required this.color,
    required this.body,
    required this.isProductDetalis,
    this.imageName,
  });
  final bool isProductDetalis;
  final bool showAppBar;
  final bool isHome;
  final bool isProfile;
  final String? screenTitle;
  final String? imageName;
  final String? actionIconPath;
  final Widget? navigateBackTo;
  final Color? color;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, bool>(
      builder: (context, isDrawerOpen) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics:
                  isDrawerOpen ? const NeverScrollableScrollPhysics() : null,
              controller: controller,
              shrinkWrap: true,
              slivers: [
                if (showAppBar)
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    expandedHeight: 60.h(),
                    collapsedHeight: 29.h(),
                    toolbarHeight: 28.h(),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(50.h()),
                      child: DefaultAppBar(),
                    ),
                  ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    Stack(
                      children: [
                        TweenAnimationBuilder(
                          tween: Tween<double>(
                              begin: 0.0, end: isDrawerOpen ? 1.0 : 0.0),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          builder: (_, double val, __) {
                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.0001)
                                ..setEntry(
                                    0, 3, isArab() ? 200 * val : -200 * val)
                                ..rotateY(isArab()
                                    ? (pi / 6) * val
                                    : (-pi / 6) * val),
                              child: GestureDetector(
                                onTap: () {
                                  if (isDrawerOpen) {
                                    context.read<DrawerCubit>().toggleDrawer();
                                  }
                                },
                                child: body,
                              ),
                            );
                          },
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(
                              begin: -2,
                              end: isDrawerOpen
                                  ? 0.0
                                  : MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? -1.1
                                      : -5),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          builder: (_, double val, __) {
                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.0001)
                                ..setEntry(
                                    0, 3, isArab() ? 200 * val : -200 * val)
                                ..rotateY(isArab()
                                    ? (pi / 6) * val
                                    : (-pi / 6) * val),
                              child: Align(
                                alignment: isArab()
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: const DrawerView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
