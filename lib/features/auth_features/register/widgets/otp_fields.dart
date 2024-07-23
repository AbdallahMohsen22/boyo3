import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class ConfirmOtpFields extends StatefulWidget {
  const ConfirmOtpFields({super.key});

  @override
  State<ConfirmOtpFields> createState() => _ConfirmOtpFieldsState();
}

class _ConfirmOtpFieldsState extends State<ConfirmOtpFields> {
  
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
      // key: context.read<RegisterCubit>().formKey,
      child: Pinput(
        controller:context.read<RegisterCubit>().otpController,
        length: 6,
        defaultPinTheme:  defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              color: //("#0d465c").withOpacity(0.8),
              Colors.grey[300],
              border: Border.all(color: Colors.grey[300]!,),
            ),),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            //color: HexColor("#0d465c"),\
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: ColorsManager.mainRed),
        ),
        showCursor: true,
        onCompleted: (pin) => validateThenDoRegister(context)),
    );
  
  }
 void validateThenDoRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitConfirmOtp();
    }
  }
 
}
