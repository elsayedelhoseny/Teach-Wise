import 'dart:async';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../constants/responsive.dart';
import '../styles/colors.dart';

class PinInputRow extends StatefulWidget {
  final TextEditingController pFController;
  final void Function(String value) onCompleted;
  final String? Function(String? value)? validator;
  final FocusNode? focusNode;

  const PinInputRow({
    super.key,
    required this.pFController,
    required this.onCompleted,
    this.validator,
    this.focusNode,
  });

  @override
  State<PinInputRow> createState() => _PinInputRowState();
}

class _PinInputRowState extends State<PinInputRow> {
  late StreamController<ErrorAnimationType> _errorAnimationController;

  @override
  void initState() {
    super.initState();
    _errorAnimationController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    _errorAnimationController.close();
    super.dispose();
  }

  PinTheme _getPinTheme(BuildContext context) {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(8),
      fieldHeight: 56.h(),
      fieldWidth: 64.w(),
      inactiveFillColor: Colors.transparent,
      activeFillColor: AppColors.pinFocusedBorderDark,
      selectedFillColor: Colors.transparent,
      inactiveColor:
          isDarkMode() ? AppColors.pinBorderDark : AppColors.darkSurface,
      activeColor:
          isDarkMode() ? AppColors.pinBorderDark : AppColors.pinBorderLight,
      selectedColor: isDarkMode()
          ? AppColors.pinFocusedBorderDark
          : AppColors.pinFocusedBorderLight,
      borderWidth: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80.h(),
          child: PinCodeTextField(
            backgroundColor: Colors.transparent,
            length: 4,
            controller: widget.pFController,
            appContext: context,
            obscureText: true,
            obscuringCharacter: '●',
            cursorColor:
                isDarkMode() ? AppColors.pinTextDark : AppColors.pinTextLight,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            enableActiveFill: true,
            hintCharacter: '',
            textStyle: TextStyle(
              color:
                  isDarkMode() ? AppColors.pinTextDark : AppColors.pinTextLight,
              fontSize: 12.fs(),
              fontWeight: FontWeight.bold,
            ),
            pinTheme: _getPinTheme(context),
            animationDuration: const Duration(milliseconds: 300),
            focusNode: widget.focusNode,
            autoFocus: true,
            errorAnimationController: _errorAnimationController,
            validator: widget.validator,
            onChanged: (_) {},
            onCompleted: widget.onCompleted,
          ),
        ),
      ),
    );
  }
}
