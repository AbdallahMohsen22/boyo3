
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/foreget_pass_confirm_email_fields.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/forget_pass_confirm_email_bloc_lisiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordConfirmEmailScreen extends StatefulWidget {
  ForgetPasswordConfirmEmailScreen({super.key});

  @override
  State<ForgetPasswordConfirmEmailScreen> createState() => _ForgetPasswordConfirmEmailScreenState();
}

class _ForgetPasswordConfirmEmailScreenState extends State<ForgetPasswordConfirmEmailScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Boyo3AppBarLogo(),
      ),
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(60),
              const Boyo3Logo(),
              verticalSpace(30),
              const ForgetPasswordConfirmEmailFields(), 
              verticalSpace(10),
              AppTextButton(
                buttonText: "Confirm",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenGoToOtp(context);

                },
              ),
              const ForgetPasswordConfirmEmailBlocListener(),
            ],
          ),
        ),
      ),
    ));
  }

  void validateThenGoToOtp(BuildContext context) {
    if (context.read<ForgetPasswordCubit>().formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().emitConfirmEmail();
    }
  }
}
