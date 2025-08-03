import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/auth_background_scaffold.dart';
import 'package:clean_arch_flutter/core/widgets/question_title.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_flutter/core/widgets/profile_card_option.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  String selectedRole = 'parent';

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      body: Column(
        children: [
          QuestionTitle(
            title: context.tr.areYou,
          ),
          SizedBox(height: 87.h()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCardOption(
                imagePath: icgraduation,
                label: context.tr.parent,
                isSelected: selectedRole == 'parent',
                onTap: () {
                  setState(() {
                    selectedRole = 'parent';
                  });
                },
              ),
              10.horizontalSB(),
              ProfileCardOption(
                imagePath: icfather,
                label: context.tr.student,
                isSelected: selectedRole == 'student',
                onTap: () {
                  setState(() {
                    selectedRole = 'student';
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
