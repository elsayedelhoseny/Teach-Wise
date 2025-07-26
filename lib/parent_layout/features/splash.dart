import 'package:clean_arch_flutter/core/constants/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String? gradientColor1;
  final String? gradientColor2;
  final String? backgroundColor;
  final String? logoImage;
  final Widget? nextPage;

  const SplashScreen({
    super.key,
    this.gradientColor1,
    this.gradientColor2,
    this.backgroundColor,
    this.nextPage,
    this.logoImage,
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
