import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: HomeCubit.get(context).isArabic
                ? 'ليس لديك حساب؟'
                : 'Don\'t have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: HomeCubit.get(context).isArabic ? ' اشتراك ' : ' Sign Up ',
            style: TextStyles.font13RedSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.confirmEmail);
              },
          ),
        ],
      ),
    );
  }
}
