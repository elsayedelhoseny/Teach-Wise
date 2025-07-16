import 'package:clean_arch_flutter/business_logic/form_field_cubit/cubit.dart';
import 'package:clean_arch_flutter/business_logic/form_field_cubit/states.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:clean_arch_flutter/core/styles/text_styles.dart';
import 'package:clean_arch_flutter/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotFormFields extends StatefulWidget {
  final TextEditingController emailController;
  final Function(String)? onSubmit;

  const ForgotFormFields({
    super.key,
    required this.emailController,
    this.onSubmit,
  });

  @override
  State<ForgotFormFields> createState() => _ForgotFormFieldsState();
}

class _ForgotFormFieldsState extends State<ForgotFormFields> {
  @override
  void dispose() {
    widget.emailController.clear();
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
              controller: widget.emailController,
              hintText: getLocalizedText(context).pleaseEnterEmail,
              keyboard: TextInputType.emailAddress,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return getLocalizedText(context).emailFieldEmpty;
                }
                return null;
              },
              suffixWidget: const Icon(Icons.email_outlined),
              onSubmit: widget.onSubmit,
            ),
          ],
        );
      },
    );
  }
}
