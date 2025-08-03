import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool isExpanded = false;
  late bool useGradient;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  void startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            width: isExpanded ? 192 : 50,
            height: isExpanded ? 141.5 : 50,
            child: Image.asset(
              iclogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
