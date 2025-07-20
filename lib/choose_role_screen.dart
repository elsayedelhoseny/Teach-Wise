import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/app_text_styles.dart';
import 'package:clean_arch_flutter/core/widgets/auth_background_scaffold.dart';
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
      child: Column(
        children: [
          QuestionTitle(),
          SizedBox(height: 87.h()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCardOption(
                imagePath: icgraduation,
                label: getLocalizedText().parent,
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
                label: getLocalizedText().student,
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

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h(),
      width: double.infinity,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 112.h(),
            end: 212.w(),
            child: Container(
              width: 31.w(),
              height: 18.h(),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFCE5CBF),
                    Color(0xFF7D58C7),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 100.h(),
            end: 160.w(),
            child: Text(
              getLocalizedText().areYou,
              style: AppTextStyles.text28Bold(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
