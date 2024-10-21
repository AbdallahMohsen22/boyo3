import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_cubit.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/register_bloc_listener.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/register_fields.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/styles.dart';
//000000000
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Boyo3AppBarLogo(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const RegisterFields(),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: HomeCubit.get(context).isArabic
                          ? "تسجيل "
                          : "Register",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        // context.read<RegisterCubit>().imageCover == null?
                        // Constants.showErrorDialog(
                        //             context: context,
                        //             msg: "من فضلك قم بادخال صورتك الشخصية اولا "):
                        validateThenDoRegister(context);
                      },
                    ),


                    const RegisterBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoRegister(BuildContext context) {
     
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates();
      //context.read<RegisterCubit>().emitConfirmEmail();
    }
    
  }
}
