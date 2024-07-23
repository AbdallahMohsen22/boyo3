import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/add_service_widgets/add_service_bloc_listener.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/add_service_widgets/add_service_fields.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/add_service_widgets/add_services_basic_images.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/theming/styles.dart';
import '../../../../../utils/dialog_utils.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

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
                verticalSpace(15),
                Column(
                  children: [
                    const AddServicesBasicImages(),
                    verticalSpace(10),
                    AddServicesFields(),
                    verticalSpace(24),

                    AppTextButton(
                      buttonText: HomeCubit.get(context).isArabic
                          ? "اضافة الخدمة"
                          : "Add Service",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        userId == null || userId == ""
                            ? DialogUtils.showMessage(context,
                                "يجب تسجيل الدخول أولا والاشتراك ف الباقات لكي تتمكن من اضافة الخدمة ",
                                posActionTitle: "تسجيل الدخول", posAction: () {
                                context.pushNamed(Routes.loginScreen);
                              },
                              negActionTitle: "لا",
                              negAction: () {
                              },
                              )
                            : context.read<ServiceCubit>().image1 == null ||
                                    context.read<ServiceCubit>().image2 ==
                                        null ||
                                    context.read<ServiceCubit>().image3 == null
                                ? Constants.showErrorDialog(
                                    context: context,
                                    msg: "من فضلك قم بادخال صور الخدمة اولا ")
                                : context.read<ServiceCubit>().longitude ==
                                            null ||
                                        context.read<ServiceCubit>().latitude ==
                                            null
                                    ? Constants.showErrorDialog(
                                        context: context,
                                        msg: "من فضلك قم بادخال الموقع اولا ")
                                    : validateThenAddCar(context);
                      },
                    ),
                    verticalSpace(16),
                    AddServiceBlocListener(),
                    // const DontHaveAccountText(),
                    // const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenAddCar(BuildContext context) {
    if (context.read<ServiceCubit>().formKey.currentState!.validate()) {
      context.read<ServiceCubit>().emitGetAddService(userId: userId!,context: context);
    }
  }
}
