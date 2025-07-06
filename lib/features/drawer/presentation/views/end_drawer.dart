import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/features/drawer/presentation/views/drawer_view.dart';
import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 30.w(context)),
          width: 292.w(context),
          child: Drawer(
            backgroundColor: Theme.of(context).primaryColor,
            child: const DrawerView(),
          ),
        ),
        PositionedDirectional(
          top: 30.h(context),
          start: 5.w(context),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 25,
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}
