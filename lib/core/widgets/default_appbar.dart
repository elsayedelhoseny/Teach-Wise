import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? actionIconPath;
  final VoidCallback? onActionTap;
  final bool centerTitle;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? textColor;

  const DefaultAppBar({
    super.key,
    this.title,
    this.actionIconPath,
    this.onActionTap,
    this.centerTitle = true,
    this.showBackButton = true,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: centerTitle,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor ?? Theme.of(context).colorScheme.primary,
              ),
            )
          : null,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back,
                  color: textColor ?? Theme.of(context).colorScheme.primary),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: actionIconPath != null
          ? [
              IconButton(
                icon: Image.asset(
                  actionIconPath!,
                  color: textColor ?? Theme.of(context).colorScheme.primary,
                ),
                onPressed: onActionTap,
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
