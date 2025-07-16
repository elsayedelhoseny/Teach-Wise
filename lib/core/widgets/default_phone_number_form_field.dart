import 'package:clean_arch_flutter/business_logic/form_field_cubit/cubit.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/constants/responsive.dart';
import 'package:clean_arch_flutter/core/styles/colors.dart';
import 'package:clean_arch_flutter/core/widgets/animated_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class DefaultPhoneNumFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final double? height;
  final double? fontSize;
  final IconData? prefixIcon;
  final Icon? noPrefix;
  final Color? prefixIconColor;
  final bool enablePrefix;
  const DefaultPhoneNumFormField(
      {super.key,
      this.controller,
      this.label,
      this.hintText,
      this.height,
      this.fontSize,
      this.prefixIcon,
      this.enablePrefix = false,
      this.noPrefix,
      this.prefixIconColor});

  @override
  Widget build(BuildContext context) {
    return DefaultAnimatedBuilder(
      animatedChild: SizedBox(
        height: height ?? 75.h(context),
        width: double.infinity,
        child: InternationalPhoneNumberInput(
          textAlign: TextAlign.start,
          spaceBetweenSelectorAndTextField: 5.w(context),
          validator: (String? value) {
            if (validatePhoneNumber(value!)) {
              return getLocalizedText(context).unacceptablePhoneNum;
            } else if (value.isEmpty) {
              return getLocalizedText(context).phoneFieldEmpty;
            }
            return null;
          },
          onInputChanged: (PhoneNumber number) {
            final phoneNumWithoutZero = registerCountry == 'EG'
                ? controller!.text.startsWith('0')
                    ? controller!.text.substring(1)
                    : controller!.text
                : controller!.text;
            controller!.value = TextEditingValue(
              text: phoneNumWithoutZero,
              selection:
                  TextSelection.collapsed(offset: phoneNumWithoutZero.length),
            );

            registerCountry = number.isoCode ?? '';
            phoneNumberField =
                '${number.dialCode!}$phoneNumWithoutZero'.replaceAll(' ', '');
            FormFieldCubit.get(context).onChangeState();
          },
          textStyle: TextStyle(
            height: 2.h(context),
            textBaseline: TextBaseline.ideographic,
            fontSize: 18.w(context),
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'BalooBhaijaan',
          ),
          selectorConfig: SelectorConfig(
            setSelectorButtonAsPrefixIcon: true,
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            leadingPadding: 20.w(context),
            trailingSpace: false,
          ),
          autoValidateMode: AutovalidateMode.onUserInteraction,
          selectorTextStyle: TextStyle(
              color: AppColors.gray,
              fontSize: 18.w(context),
              height: 1.h(context),
              textBaseline: TextBaseline.ideographic),
          countries: const ['EG', 'SA', 'US'],
          initialValue: PhoneNumber(isoCode: registerCountry),
          textFieldController: controller,
          ignoreBlank: false,
          inputDecoration: InputDecoration(
            contentPadding: const EdgeInsetsDirectional.only(end: 10),
            errorStyle: TextStyle(height: 0.1.h(context)),
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            prefixIcon: enablePrefix
                ? Container(
                    margin: const EdgeInsetsDirectional.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                            end: BorderSide(
                      color: prefixIconColor ?? AppColors.gray,
                      width: 1,
                    ))),
                    child: Icon(
                      prefixIcon,
                    ),
                  )
                : noPrefix,
            hintStyle: const TextStyle(
                textBaseline: TextBaseline.ideographic,
                fontSize: 18,
                fontFamily: 'BalooBhaijaan',
                color: AppColors.gray),
            label: label != null
                ? getLocalizedText(context).localeName == 'ar'
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(end: 10.w(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              label!,
                              style: TextStyle(
                                height: 1,
                                color: AppColors.gray,
                                fontFamily: 'ph-khalid',
                                fontSize: 20.w(context),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        label!,
                        style: TextStyle(
                          height: 1,
                          color: AppColors.gray,
                          fontFamily: 'ph-khalid',
                          fontSize: 22.w(context),
                        ),
                      )
                : null,
            suffixIcon: controller!.text.isEmpty
                ? null
                // Padding(
                //   padding: EdgeInsetsDirectional.only(end: getLocalizedText(context).localeName == 'ar' ? 20.w:0),
                //       child: const Icon(
                //         Icons.phone_iphone_rounded,
                //
                //   color: AppColors.gray,
                // ),
                //     )
                : IconButton(
                    onPressed: () {
                      controller!.clear();
                      FormFieldCubit.get(context).onChangeState();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 18,
                      color: AppColors.gray,
                    ),
                  ),
            labelStyle: TextStyle(
              color: AppColors.gray,
              fontFamily: 'BalooBhaijaan',
              fontSize: 22.w(context),
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.gray,
              ),
              borderRadius: BorderRadius.circular(15.w(context)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.gray,
              ),
              borderRadius: BorderRadius.circular(15.w(context)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.gray,
              ),
              borderRadius: BorderRadius.circular(15.w(context)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(15.w(context)),
            ),
          ),
          keyboardType: TextInputType.number,
          onSaved: (PhoneNumber number) {
            if (kDebugMode) {
              print('On Saved: $number');
            }
          },
          onSubmit: () {
            FocusScope.of(context).nearestScope.nextFocus();
          },
        ),
      ),
    );
  }
}
