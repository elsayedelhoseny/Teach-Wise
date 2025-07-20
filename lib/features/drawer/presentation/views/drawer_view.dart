import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.w(),
      height: screenHeight - 150.h(),
      child: ListView(
        shrinkWrap: true,
        children: [],
      ),
    );
  }
}
