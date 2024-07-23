import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/DontHaveAccountText.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/forget_password._widget.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/login_bloc_listner.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/terms_and_condition.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../home_features/screens/home/home_screen.dart';
import 'widgets/email_and_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Text(
                  HomeCubit.get(context).isArabic
                      ? "مرحبًا بعودتك"
                      : 'Welcome Back',
                  style: TextStyles.font24RedBold,
                ),
                verticalSpace(8),
                Text(
                  HomeCubit.get(context).isArabic
                      ? "نحن متحمسون لعودتك، ولا يمكننا الانتظار لنرى ما كنت تفعله منذ آخر مرة قمت فيها بتسجيل الدخول."
                      : 'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(5),
                    const ForgetPasswordWidget(),
                    verticalSpace(24),
                    const TermsAndConditionsText(),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: HomeCubit.get(context).isArabic
                          ? "تسجيل الدخول"
                          : "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const DontHaveAccountText(),

                    SizedBox(height: 10,),
                    Center(child: Padding(padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(onTap: () {
                        context.pushNamed(Routes.homeScreen);

                      },
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                          Text(HomeCubit.get(context).isArabic
                              ? "الدخول كزائر"
                              : "Login as a Guest",
                            style: TextStyles.font14GrayRegular,),
                          Icon(Icons.arrow_forward, size: 15,color: Theme.of(context).primaryColor,)
                        ],
                        ),
                      ),
                    )),


                    const LoginBlocListener(),
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
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
