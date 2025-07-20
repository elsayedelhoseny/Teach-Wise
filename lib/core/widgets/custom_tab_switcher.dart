import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/lists.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTabSwitcher extends StatefulWidget {
  const CustomTabSwitcher({
    super.key,
    required this.tabs,
  });

  final List<CustomTab> tabs;

  @override
  State<CustomTabSwitcher> createState() => _CustomTabSwitcherState();
}

class _CustomTabSwitcherState extends State<CustomTabSwitcher> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h(),
          margin: EdgeInsets.symmetric(horizontal: 32.w()),
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 8.w(), vertical: 6.h()),
          decoration: BoxDecoration(
            color: isDarkMode() ? const Color(0xFF0D1325) : AppColors.gray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.tabs.length, (index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 144.w(),
                  height: 28.h(),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: isSelected ? AppColors.buttonGradient : null,
                  ),
                  child: Text(
                    widget.tabs[index].title,
                    style: AppTextStyles.text16Medium().copyWith(
                        color: isDarkMode() ? Colors.white : Colors.black),
                  ),
                ),
              );
            }),
          ),
        ),
        20.verticalSB(),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(
                position: offsetAnimation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: KeyedSubtree(
              key: ValueKey(selectedIndex),
              child: widget.tabs[selectedIndex].screen,
            ),
          ),
        ),
      ],
    );
  }
}
