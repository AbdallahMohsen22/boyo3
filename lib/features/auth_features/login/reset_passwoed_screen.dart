import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/reset_password_bloc_listener.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/reset_password_fields.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/styles.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Boyo3AppBarLogo(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(35),
                Boyo3Logo(),
                verticalSpace(36),
                Column(
                  children: [
                    const ResetPasswordFields(),
                    AppTextButton(
                      buttonText: HomeCubit.get(context).isArabic
                          ? "تاكيد"
                          : "Confirm",
                        
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const ResetPasswordBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<ForgetPasswordCubit>().formKey.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().emitResetPassword();
    }
  }
}
