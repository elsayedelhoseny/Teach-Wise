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
          height: 40.h(context),
          margin: EdgeInsets.symmetric(horizontal: 32.w(context)),
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: 8.w(context), vertical: 6.h(context)),
          decoration: BoxDecoration(
            color:
                isDarkMode(context) ? const Color(0xFF0D1325) : AppColors.gray,
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
                  width: 144.w(context),
                  height: 28.h(context),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: isSelected ? AppColors.buttonGradient : null,
                  ),
                  child: Text(
                    widget.tabs[index].title,
                    style: AppTextStyles.text16Medium(context).copyWith(
                        color:
                            isDarkMode(context) ? Colors.white : Colors.black),
                  ),
                ),
              );
            }),
          ),
        ),
        20.verticalSizedBox(context),
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
