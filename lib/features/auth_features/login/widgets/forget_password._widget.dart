import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: () {
              context.pushNamed(Routes.forgetPasswordConfirmEmail);
            },
            child: Text(
              HomeCubit.get(context).isArabic
                  ? "نسيت كلمةالمرور"
                  : "Forget Password",
              style: TextStyles.font15MainRed,
            )),
      ],
    );
  }
}
