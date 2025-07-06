import 'package:flutter/material.dart';

class PasswordValidator {
  static String? validatePassword(String value) {
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون أقوى';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تكون أقوى';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تكون أقوى';
    } else if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'كلمة المرور يجب أن تحتوي على رمز خاص';
    }
    return null; // لا توجد مشاكل، كلمة المرور قوية
  }

  static void showPasswordHint(BuildContext context, String password) {
    List<String> conditions = [
      "8 أحرف على الأقل",
      "حرف كبير",
      "حرف صغير",
      "رقم",
      "رمز خاص"
    ];

    if (password.length >= 8) {
      conditions.remove("8 أحرف على الأقل");
    }
    if (RegExp(r'[A-Z]').hasMatch(password)) {
      conditions.remove("حرف كبير");
    }
    if (RegExp(r'[a-z]').hasMatch(password)) {
      conditions.remove("حرف صغير");
    }
    if (RegExp(r'[0-9]').hasMatch(password)) {
      conditions.remove("رقم");
    }
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
      // تحقق من وجود رمز خاص
      conditions.remove("رمز خاص");
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "يجب أن تحتوي كلمة المرور على:\n\n${conditions.join('\n- ')}",
          ),
          actions: [
            TextButton(
              child: const Text("إغلاق"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
