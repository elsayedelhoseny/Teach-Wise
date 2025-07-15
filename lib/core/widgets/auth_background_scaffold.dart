import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:flutter/material.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  const AuthBackgroundScaffold({
    super.key,
    required this.child,
    this.topRadius = 32,
  });

  final Widget child;
  final double topRadius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const _BackgroundGradient(),
          PositionedDirectional(
            top: 230.h(context),
            start: 0,
            end: 0,
            bottom: 0,
            child: _BottomContainer(
              radius: topRadius,
              child: child,
            ),
          ),
          PositionedDirectional(
            top: 65.h(context),
            start: 0,
            end: 0,
            child: _StudentWelcomeImage(),
          ),
        ],
      ),
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1a1a2e),
            Color(0xFF16213e),
            Color(0xFF0f0f23),
          ],
        ),
      ),
    );
  }
}

class _BottomContainer extends StatelessWidget {
  const _BottomContainer({
    required this.child,
    this.radius = 32,
  });

  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff070B16),
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
        child: Padding(
          padding: EdgeInsets.only(top: 50.h(context)),
          child: child,
        ),
      ),
    );
  }
}

class _StudentWelcomeImage extends StatelessWidget {
  const _StudentWelcomeImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/student_graduation.png.png',
      width: 265.w(context),
      height: 200.h(context),
    );
  }
}
