import 'package:clean_arch_flutter/business_logic/form_field_cubit/cubit.dart';
import 'package:clean_arch_flutter/business_logic/form_field_cubit/states.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/styles/text_styles.dart';
import 'package:clean_arch_flutter/core/widgets/default_text_form_field.dart';
import 'package:clean_arch_flutter/features/auth/presentation/register/presentation/views/widgets/register_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/////////////////////controls of screen//////////////////////////////////
///  text ='Phone Number'
String emailTextOfLoginScreen(context) => getLocalizedText().areYou;

/// fontWeight of text ='Phone Number'
const FontWeight phoneFontWeightOfLoginScreen = FontWeight.bold;

/// width of SizedBox of PhoneNumFormField
const double phoneNumFormFieldWidthOfLoginScreen = double.infinity;

/// controller of mobilePhoneFormField of login screen
TextEditingController emailControllerOfLoginScreen(widget) =>
    widget.emailController;

/// hintText of PhoneNumFormField ='Please enter your phone number'
String emailFormFieldHintTextOfLoginScreen(context) =>
    getLocalizedText().areYou;

///  text = 'Password'
String passwordOfLoginScreen(context) => getLocalizedText().areYou;

/// fontWeight of text ='Password'
const FontWeight passwordFontWeightOfLoginScreen = FontWeight.bold;

/// width of SizedBox of passwordFormField
const double passwordFormFieldWidthOfLoginScreen = double.infinity;

/// to appear suffix icon of passwordFormField on login screen
const bool enableSuffixOfPasswordFormFieldOfLoginScreen = true;

/// controller of passwordFormField of login screen
TextEditingController controllerOfPasswordOfLoginScreen(widget) =>
    widget.passwordController;

/// hintText of  passwordFormField ='Please enter your password'
String passwordFormFieldHintTextOfLoginScreen(context) =>
    getLocalizedText().areYou;

/// to make keyboard enter phone number password
TextInputType? emailKeyboardOfLoginScreen = TextInputType.emailAddress;
TextInputType? passwordKeyboardOfLoginScreen = TextInputType.visiblePassword;

/// function to show password when change visibility from visibility_outlined to visibility_off_outlined
bool isPasswordOfLoginScreen(context) => FormFieldCubit.get(context).isPassword;

/// suffix icon of login screen
IconData? suffixIconOfLoginScreen(context) =>
    FormFieldCubit.get(context).suffixIcon;

/// function to change visibility icon from visibility_outlined to visibility_off_outlined
void Function() changeVisibilityOfLoginScreen(context) => () {
      FormFieldCubit.get(context).changeVisibility();
    };

/// validate function of password form field to ensure that the password entered by users
String? Function(String?)? passValidateOfLoginScreen(context) =>
    (String? value) {
      if (value!.isEmpty) {
        return getLocalizedText().areYou;
      }

      return null;
    };

////////////////////////////////////////////////////////////////////////////////////////////////////////
class LoginFormFields extends StatefulWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final Function(String)? onSubmit;
  LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.onSubmit,
  });

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  @override
  void dispose() {
    widget.emailController.clear();
    widget.passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormFieldCubit, FormFieldStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(
                height: screenHeight,
              ),
              SizedBox(
                width: passwordFormFieldWidthOfLoginScreen,
                child: DefaultFormField(
                  enablePrefix: true,
                  prefixIcon: Icons.key,
                  onSubmit: widget.onSubmit,
                  enableSuffix: enableSuffixOfPasswordFormFieldOfLoginScreen,
                  controller: controllerOfPasswordOfLoginScreen(widget),
                  hintText: passwordFormFieldHintTextOfLoginScreen(context),
                  keyboard: passwordKeyboardOfLoginScreen,
                  isPassword: isPasswordOfLoginScreen(context),
                  suffixIcon: suffixIconOfLoginScreen(context),
                  suffixPressed: changeVisibilityOfLoginScreen(context),
                  validate: passValidateOfLoginScreen(context),
                ),
              ),
            ],
          );
        });
  }
}
