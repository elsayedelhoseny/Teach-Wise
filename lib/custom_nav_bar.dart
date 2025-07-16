import 'package:clean_arch_flutter/c.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/features/Home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  MainNavBarState createState() => MainNavBarState();
}

class MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    HomeScreen(),
    AddScreen(),
    HomeMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onUserTap: () => setState(() => _selectedIndex = 0),
        onAddTap: () => setState(() => _selectedIndex = 1),
        onHomeTap: () => setState(() => _selectedIndex = 2),
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final VoidCallback? onUserTap;
  final VoidCallback? onAddTap;
  final VoidCallback? onHomeTap;
  final int selectedIndex;

  const CustomNavBar({
    super.key,
    this.onUserTap,
    this.onAddTap,
    this.onHomeTap,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        height: 90.h(context),
        decoration: BoxDecoration(
          color: isDarkMode(context) ? Color(0xFF0F0F23) : Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32.w(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              context: context,
              icon: icProfile,
              isSelected: selectedIndex == 0,
              onTap: onUserTap,
            ),
            _buildNavItem(
              context: context,
              icon: icAdd,
              isSelected: selectedIndex == 1,
              onTap: onAddTap,
              isCenter: true,
            ),
            _buildNavItem(
              context: context,
              icon: icHome,
              isSelected: selectedIndex == 2,
              onTap: onHomeTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      {required String icon,
      required bool isSelected,
      VoidCallback? onTap,
      bool isCenter = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: isCenter ? 56 : 36,
              height: isCenter ? 56 : 36,
              decoration: isCenter
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.buttonGradient,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x30000000),
                          blurRadius: 21.5,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    )
                  : null,
              child: Image.asset(
                icon,
                width: 24.w(context),
                height: 24.h(context),
                color: isDarkMode(context) ? Colors.white : Colors.black,
              )),
          14.verticalSizedBox(context),
          _buildIndicator(isSelected)
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isSelected ? 20 : 0,
      height: isSelected ? 10 : 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 22,
              height: 4.4,
              decoration: BoxDecoration(
                color: Color(0xFF9C27B0),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned(
            top: 2,
            child: Container(
              width: 12,
              height: 9,
              decoration: BoxDecoration(
                color: Color(0xFF9C27B0),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
