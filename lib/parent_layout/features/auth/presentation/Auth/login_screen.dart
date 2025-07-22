import 'package:clean_arch_flutter/core/constants/lists.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/auth_background_scaffold.dart';
import 'package:clean_arch_flutter/core/widgets/custom_tab_switcher.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h()),
      child: CustomTabSwitcher(
        tabs: tabs,
      ),
    ));
  }
}
