import 'package:clean_arch_flutter/business_logic/form_field_cubit/states.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormFieldCubit extends Cubit<FormFieldStates> {
  FormFieldCubit() : super(InitialState());

  static FormFieldCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  Future<void> changeVisibility() async {
    isPassword = !isPassword;

    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(VisibilityChangedState());
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      isPassword = !isPassword;
      suffixIcon = isPassword
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
      emit(VisibilityChangedState());
    });
  }

  IconData newSuffixIcon = Icons.visibility_outlined;
  bool isNewPassword = true;

  Future<void> changeNewVisibility() async {
    isNewPassword = !isNewPassword;

    newSuffixIcon = isNewPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(VisibilityChangedState());
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      isNewPassword = !isNewPassword;
      newSuffixIcon = isNewPassword
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
      emit(VisibilityChangedState());
    });
  }

  IconData confirmedPasswordSuffixIcon = Icons.visibility_outlined;
  bool isConfirmPassword = true;

  Future<void> changeConfirmVisibility() async {
    isConfirmPassword = !isConfirmPassword;

    confirmedPasswordSuffixIcon = isConfirmPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(VisibilityChangedState());
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      isConfirmPassword = !isConfirmPassword;
      confirmedPasswordSuffixIcon = isConfirmPassword
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
      emit(VisibilityChangedState());
    });
  }

  bool passwordFormError = false;

  void onChangeState() {
    emit(OnChangeFieldState());
  }

  void shake() {
    if (defaultFormFieldAnimationController.status ==
        AnimationStatus.completed) {
      defaultFormFieldAnimationController.reset();
      defaultFormFieldAnimationController.forward();
    } else {
      defaultFormFieldAnimationController.forward();
    }
  }
}
