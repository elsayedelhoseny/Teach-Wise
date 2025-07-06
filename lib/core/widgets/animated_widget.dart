import 'dart:math';

import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultAnimatedBuilder extends StatefulWidget {
  final Widget animatedChild;
  const DefaultAnimatedBuilder({
    super.key,
    required this.animatedChild,
  });

  @override
  State<DefaultAnimatedBuilder> createState() => _DefaultAnimatedBuilderState();
}

class _DefaultAnimatedBuilderState extends State<DefaultAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    defaultFormFieldAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: defaultFormFieldAnimationController,
      builder: (context, child) {
        final sineValue =
            sin(4 * 2 * pi * defaultFormFieldAnimationController.value);
        return Transform.translate(
          offset: Offset(sineValue * 10, 0),
          child: widget.animatedChild,
        );
      },
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }
}
