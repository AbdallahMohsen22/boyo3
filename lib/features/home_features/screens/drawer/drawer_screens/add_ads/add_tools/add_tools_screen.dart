import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_tools/add_tools_widgets/add_tools_fields.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_vehicle_basics_images.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/drawer_screens/add_ads/add_vehicles_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/theming/styles.dart';

class AddToolsScreen extends StatelessWidget {
  const AddToolsScreen({super.key});

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
                    const AddVehiclesBasicImages(),
                    verticalSpace(10),
                    AddToolsFields(),
                    verticalSpace(24),

                    AppTextButton(
                      buttonText: HomeCubit.get(context).isArabic
                          ? "اضافة الاداة"
                          : "Add Tools",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        userId == null || userId == ""
                            ? Constants.showErrorDialog(
                                context: context,
                                msg:
                                    "يجب تسجيل الدخول أولا والاشتراك ف الباقات لكي تتمكن من اضافع اعلانك ")
                            : context.read<VehicleCubit>().image1 == null ||
                                    context.read<VehicleCubit>().image2 ==
                                        null ||
                                    context.read<VehicleCubit>().image3 == null
                                ? Constants.showErrorDialog(
                                    context: context,
                                    msg: "من فضلك قم بادخال صور الاداةاولا ")
                                : validateThenAddCar(context);
                      },
                    ),
                    verticalSpace(16),
                    AddVehiclesBlocListener(),
                   
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
    if (context.read<VehicleCubit>().formKey.currentState!.validate()) {
      context.read<VehicleCubit>().emitAddTools(id: userId!,context: context);
    }
  }
}
