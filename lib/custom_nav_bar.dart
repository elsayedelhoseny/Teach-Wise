import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreenssd extends StatefulWidget {
  @override
  _HomeScreenssdState createState() => _HomeScreenssdState();
}

class _HomeScreenssdState extends State<HomeScreenssd> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    UserScreen(),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          height: 90.h(context),
          decoration: BoxDecoration(
            color: Color(0xFF0F0F23),
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.symmetric(horizontal: 32.w(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                icon: Images.icProfile,
                isSelected: selectedIndex == 0,
                onTap: onUserTap,
              ),
              _buildNavItem(
                icon: Images.icAdd,
                isSelected: selectedIndex == 1,
                onTap: onAddTap,
                isCenter: true,
              ),
              _buildNavItem(
                icon: Images.icHome,
                isSelected: selectedIndex == 2,
                onTap: onHomeTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required bool isSelected,
    VoidCallback? onTap,
    bool isCenter = false,
  }) {
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
                      gradient: LinearGradient(
                        colors: [Color(0xFF9C27B0), Color(0xFF673AB7)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF9C27B0).withOpacity(0.4),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    )
                  : null,
              child: Image.asset(
                icon,
                width: 24,
                height: 24,
                color: Colors.white,
              )),
          SizedBox(height: 6),
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

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'شاشة المستخدم',
        style: TextStyle(color: Colors.amberAccent, fontSize: 24),
      ),
    );
  }
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'شاشة الإضافة',
        style: TextStyle(color: Colors.amberAccent, fontSize: 24),
      ),
    );
  }
}

class HomeMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'الشاشة الرئيسية',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }
}
