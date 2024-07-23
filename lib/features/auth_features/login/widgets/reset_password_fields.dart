import 'package:boyo3_v1/core/helpers/app_regs.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/password_validation.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class ResetPasswordFields extends StatefulWidget {
  const ResetPasswordFields({super.key});

  @override
  State<ResetPasswordFields> createState() => _ResetPasswordFieldsState();
}

class _ResetPasswordFieldsState extends State<ResetPasswordFields> {
  bool isVisible = false;
  bool isObscureText = true;
  bool isObscureText2 = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;


  @override
  void initState() {
    super.initState();
    newPasswordController = context.read<ForgetPasswordCubit>().newPasswordController;
    confirmPasswordController = context.read<ForgetPasswordCubit>().confirmPasswordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    newPasswordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(newPasswordController.text);
        hasUppercase = AppRegex.hasUpperCase(newPasswordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(newPasswordController.text);
        hasNumber = AppRegex.hasNumber(newPasswordController.text);
        hasMinLength = AppRegex.hasMinLength(newPasswordController.text);
      });
    });

    confirmPasswordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(confirmPasswordController.text);
        hasUppercase = AppRegex.hasUpperCase(confirmPasswordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(confirmPasswordController.text);
        hasNumber = AppRegex.hasNumber(confirmPasswordController.text);
        hasMinLength = AppRegex.hasMinLength(confirmPasswordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<ForgetPasswordCubit>().newPasswordController,
            hintText: 'New Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<ForgetPasswordCubit>().confirmPasswordController,
            hintText: 'Confirm Password',
            isObscureText: isObscureText2,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText2 = !isObscureText2;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(10),
          InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Row(
              children: [
                Text(
                  HomeCubit.get(context).isArabic?
                  "قوة الباسورد ":'Password validation',
                  style: TextStyles.font15MainRed,
                ),
                Spacer(),
                Icon(
                  isVisible!=true? Icons.arrow_drop_down:Icons.arrow_drop_up,
                  color: ColorsManager.mainRed,
                )
              ],
            ),
          ),
          verticalSpace(5),

          Visibility(
            visible: isVisible,
            child: PasswordValidations(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ),
          verticalSpace(15),

        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
