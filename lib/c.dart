import 'package:clean_arch_flutter/core/widgets/teacher_card.dart';
import 'package:flutter/material.dart';

// تأكد من استيراد TeacherCard هنا
// import 'path_to_teacher_card.dart';

class LoginScrsseen extends StatelessWidget {
  const LoginScrsseen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: TeacherCard(
          teacherName: "مستر أحمد سمير",
          subject: "(مدرس تاريخ وجغرافيا)",
          studentCode: "855541225",
          imageUrl: "https://via.placeholder.com/150", // صورة تجريبية
          rating: 5.0,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailsScreen()),
          ),
        ),
      ),
    );
  }
}

// شاشة تجريبية للانتقال إليها
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل المدرس')),
      body: const Center(child: Text("محتوى صفحة التفاصيل")),
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
