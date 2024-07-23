import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/shared_constants.dart';


class ForgetPasswordConfirmEmailFields extends StatefulWidget {
  const ForgetPasswordConfirmEmailFields({super.key});

  @override
  State<ForgetPasswordConfirmEmailFields> createState() => _ForgetPasswordConfirmEmailFieldsState();
}

class _ForgetPasswordConfirmEmailFieldsState extends State<ForgetPasswordConfirmEmailFields> {
  
final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: ColorsManager.mainRed),
    ),
  );
    Color focusedBorderColor = const Color.fromRGBO(23, 171, 144, 1);
  Color fillColor = const Color.fromRGBO(243, 246, 249, 0);
  Color borderColor = const Color.fromRGBO(23, 171, 144, 0.4);

  @override
  Widget build(BuildContext context) {

    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          ///email
          AppTextFormField(
            controller: context.read<ForgetPasswordCubit>().emailController,
            hintText: 'Email address',
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'please enter Email Address';
              }
              if (!ValidationUtils.isValidEmail(text)) {
                return 'please enter a valid email';
              }
              return null;
            },),
            verticalSpace(20.0),
          
         
           
        ],
      ),
    );
  
  }

 
}