import 'package:flutter/material.dart';

class ClickableAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Duration duration;

  const ClickableAnimation({
    super.key,
    required this.child,
    this.onPressed,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  ClickableAnimationState createState() => ClickableAnimationState();
}

class ClickableAnimationState extends State<ClickableAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed != null
          ? () {
              _controller.forward().then((_) {
                _controller.reverse();
              }).then((v) {
                widget.onPressed!();
              });
            }
          : null,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: widget.child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
