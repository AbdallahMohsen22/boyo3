
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_cubit.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/confirm_email_bloc_listener.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/confirm_email_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmEmailScreen extends StatefulWidget {
  ConfirmEmailScreen({super.key});

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {



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
              const ConfirmEmailFields(), 
              verticalSpace(10),
              AppTextButton(
                buttonText: "Confirm",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenDoRegister(context);
                },
              ),
              const ConfirmEmailBlocListener(),
            ],
          ),
        ),
      ),
    ));
  }

  void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitConfirmEmail();
    }
  }
}
