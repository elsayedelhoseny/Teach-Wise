import 'package:clean_arch_flutter/core/constants/lists.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/widgets/auth_background_scaffold.dart';
import 'package:clean_arch_flutter/features/Home/presentation/views/home_screen.dart';
import 'package:clean_arch_flutter/features/auth/presentation/login/presentation/views/login_screen.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';

import 'core/widgets/custom_tab_switcher.dart';

class LoginScrsseen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Text(
            'مرحباً بك',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Text(
            'قم بتسجيل الدخول للمتابعة',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
        SizedBox(height: 40.h(context)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    hintText: 'البريد الإلكتروني',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.h(context)),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    hintText: 'كلمة المرور',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30.h(context)),
                // زر تسجيل الدخول
                SizedBox(
                  width: double.infinity,
                  height: 50.h(context),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6c5ce7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundScaffold(
      child: CustomTabSwitcher(
        tabs: tabs,
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
