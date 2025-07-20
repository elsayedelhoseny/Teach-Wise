import 'package:clean_arch_flutter/business_logic/form_field_cubit/cubit.dart';
import 'package:clean_arch_flutter/business_logic/form_field_cubit/states.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/styles/text_styles.dart';
import 'package:clean_arch_flutter/core/widgets/default_phone_number_form_field.dart';
import 'package:clean_arch_flutter/core/widgets/default_text_form_field.dart';
import 'package:clean_arch_flutter/core/widgets/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///////////////////////////controls of register form fields/////////////////////////////

///text='username'
String usernameText() => getLocalizedText().areYou;
String modifypersonaldata() => getLocalizedText().areYou;

///fontWeight of text='username'
const FontWeight usernameFontWeight = FontWeight.normal;

///mainAxisSize of column of screen
const MainAxisSize columnMainAxisSize = MainAxisSize.min;

///icon of user name form field
const IconData usernamePrefixIcon = Icons.person;

///hint text of user name form field ='please enter your name'
String usernameHintText() => getLocalizedText().areYou;

///to make keyboard enter usernames
TextInputType? keyboard = TextInputType.name;

/// validate function to receive  the name that the user has entered
String? Function(String?)? nameValidate() => (String? value) {
      if (value!.isEmpty) {
        return getLocalizedText().areYou;
      }
      return null;
    };

///text='Phone Number'
String phoneNumberText() => getLocalizedText().areYou;

///fontWeight of text='Phone Number'
const FontWeight phoneNumberFontWeight = FontWeight.normal;

///hint text of phone number form field ='please enter your name'
String phoneNumberHintText() => getLocalizedText().areYou;

///text= 'Password'
String emailtext() => getLocalizedText().areYou;

///fontWeight of text='Password'
const FontWeight passwordNumberFontWeight = FontWeight.normal;

///icon of password form field
const IconData passwordPrefixIcon = Icons.lock;

///color of hint text
const Color hintTextColor = AppColors.gray;

///font size of hint text
double hintTextFontSize = 16;

///to make keyboard passwords that are visible to the user.
TextInputType? passwordKeyboard = TextInputType.visiblePassword;

///hint text of password form field ='please create a strong password'
String emailHintText(context) => getLocalizedText().areYou;

/// function to change visibility_outlined icon to visibility_off_outlined icon
void Function() changeVisibility(context) => () {
      FormFieldCubit.get(context).changeVisibility();
    };

///hint text of password form field ='please confirm your password'
String PasswordHintText(context) => getLocalizedText().areYou;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class RegisterFormFields extends StatefulWidget {
  var userNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  RegisterFormFields({
    super.key,
    required this.userNameController,
    required this.mobileController,
    required this.passwordController,
    required this.emailController,
  });

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields> {
  String? passwordMessage;

  @override
  void initState() {
    FormFieldCubit.get(context).passwordFormError = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormFieldCubit, FormFieldStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: columnMainAxisSize,
            children: [
              DefaultFormField(
                enablePrefix: true,
                prefixIcon: Icons.edit_outlined,
                controller: widget.userNameController,
                hintText: usernameHintText(),
                keyboard: keyboard,
                validate: nameValidate(),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: DefaultPhoneNumFormField(
                  enablePrefix: true,
                  prefixIcon: Icons.work_outlined,
                  controller: widget.mobileController,
                  hintText: phoneNumberHintText(),
                ),
              ),
              DefaultFormField(
                enableSuffix: true,
                controller: widget.emailController,
                hintText: emailHintText(context),
                keyboard: keyboard,
                validate: nameValidate(),
                suffixWidget: Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                          start: BorderSide(
                    color: AppColors.gray,
                    width: 1,
                  ))),
                  child: const Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
              Stack(
                children: [
                  DefaultFormField(
                    enablePrefix: true,
                    prefixIcon: Icons.key,
                    enableSuffix: true,
                    hintText: PasswordHintText(context),
                    controller: widget.passwordController,
                    hintTextStyle: TextStyle(
                      color: hintTextColor,
                      fontSize: hintTextFontSize,
                    ),
                    keyboard: TextInputType.visiblePassword,
                    suffixPressed:
                        FormFieldCubit.get(context).changeNewVisibility,
                    isPassword: FormFieldCubit.get(context).isNewPassword,
                    suffixIcon: FormFieldCubit.get(context).newSuffixIcon,
                    onChange: (value) {
                      setState(() {
                        passwordMessage =
                            PasswordValidator.validatePassword(value);
                      });
                    },
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return getLocalizedText().areYou;
                      }
                      return null;
                    },
                  ),
                  if (passwordMessage != null &&
                      widget.passwordController.text.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 68.h(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              passwordMessage!,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                            ),
                            10.horizontalSB(),
                            GestureDetector(
                              onTap: () => PasswordValidator.showPasswordHint(
                                  context, widget.passwordController.text),
                              child: const Icon(Icons.error_outline,
                                  color: Colors.red, size: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          );
        });
  }
}
