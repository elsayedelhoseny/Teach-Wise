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
String usernameText(context) => getLocalizedText(context).fullName;
String modifypersonaldata(context) =>
    getLocalizedText(context).modifypersonaldata;

///fontWeight of text='username'
const FontWeight usernameFontWeight = FontWeight.normal;

///mainAxisSize of column of screen
const MainAxisSize columnMainAxisSize = MainAxisSize.min;

///icon of user name form field
const IconData usernamePrefixIcon = Icons.person;

///hint text of user name form field ='please enter your name'
String usernameHintText(context) => getLocalizedText(context).enteryourfullname;

///to make keyboard enter usernames
TextInputType? keyboard = TextInputType.name;

/// validate function to receive  the name that the user has entered
String? Function(String?)? nameValidate(context) => (String? value) {
      if (value!.isEmpty) {
        return getLocalizedText(context).nameFieldEmpty;
      }
      return null;
    };

///text='Phone Number'
String phoneNumberText(context) => getLocalizedText(context).phone;

///fontWeight of text='Phone Number'
const FontWeight phoneNumberFontWeight = FontWeight.normal;

///hint text of phone number form field ='please enter your name'
String phoneNumberHintText(context) =>
    getLocalizedText(context).pleaseEnterPhoneNum;

///text= 'Password'
String emailtext(context) => getLocalizedText(context).email;

///fontWeight of text='Password'
const FontWeight passwordNumberFontWeight = FontWeight.normal;

///icon of password form field
const IconData passwordPrefixIcon = Icons.lock;

///color of hint text
const Color hintTextColor = AppColor.lightGray;

///font size of hint text
double hintTextFontSize = 16;

///to make keyboard passwords that are visible to the user.
TextInputType? passwordKeyboard = TextInputType.visiblePassword;

///hint text of password form field ='please create a strong password'
String emailHintText(context) => getLocalizedText(context).pleaseEnterEmail;

/// function to change visibility_outlined icon to visibility_off_outlined icon
void Function() changeVisibility(context) => () {
      FormFieldCubit.get(context).changeVisibility();
    };

///hint text of password form field ='please confirm your password'
String PasswordHintText(context) => getLocalizedText(context).registerPassword;

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
              BodyText(
                text: usernameText(context),
                fontWeight: usernameFontWeight,
              ),
              DefaultFormField(
                enablePrefix: true,
                prefixIcon: Icons.edit_outlined,
                controller: widget.userNameController,
                hintText: usernameHintText(context),
                keyboard: keyboard,
                validate: nameValidate(context),
              ),
              BodyText(
                text: phoneNumberText(context),
                fontWeight: phoneNumberFontWeight,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: DefaultPhoneNumFormField(
                  enablePrefix: true,
                  prefixIcon: Icons.work_outlined,
                  controller: widget.mobileController,
                  hintText: phoneNumberHintText(context),
                ),
              ),
              BodyText(
                text: emailtext(context),
                fontWeight: passwordNumberFontWeight,
              ),
              DefaultFormField(
                enableSuffix: true,
                controller: widget.emailController,
                hintText: emailHintText(context),
                keyboard: keyboard,
                validate: nameValidate(context),
                suffixWidget: Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                          start: BorderSide(
                    color: AppColor.gray,
                    width: 1,
                  ))),
                  child: const Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
              BodyText(
                text: getLocalizedText(context).password,
                fontWeight: FontWeight.normal,
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
                        return getLocalizedText(context).newPasswordFieldEmpty;
                      }
                      return null;
                    },
                  ),
                  if (passwordMessage != null &&
                      widget.passwordController.text.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 68.h(context),
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
                            10.horizontalSizedBox(context),
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
