
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/forget_pass_otp_bloc_listener.dart';
import 'package:boyo3_v1/features/auth_features/login/widgets/forget_password_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgetPasswordOtpScreen extends StatefulWidget {
  ForgetPasswordOtpScreen({super.key});

  @override
  State<ForgetPasswordOtpScreen> createState() => _ForgetPasswordOtpScreenState();
}

class _ForgetPasswordOtpScreenState extends State<ForgetPasswordOtpScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Boyo3AppBarLogo(),
      ),
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.0.w),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(60),            
                Text(
                  'Welcome',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you a member , can\'t wait to see what you\'ve , we send you an vervication code please check it .',
                  style: TextStyles.font14GrayRegular,
                ),
              verticalSpace(30),
              const ForgetPasswordConfirmOtpFields(),
              const ForgetPasswordOtpBlocListener(),
              
            ],
          ),
        ),
      ),
    ));
  }


}
