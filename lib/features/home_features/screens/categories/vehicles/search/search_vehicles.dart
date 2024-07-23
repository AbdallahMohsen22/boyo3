import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_form_field.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/gold_vehicle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchVehiclesScreen extends StatefulWidget {
  const SearchVehiclesScreen({super.key});

  @override
  State<SearchVehiclesScreen> createState() => _SearchVehiclesScreenState();
}

class _SearchVehiclesScreenState extends State<SearchVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: context.read<VehicleCubit>().searchNameController,
                      hintText:  HomeCubit.get(context).isArabic? "اسم المركية او الاداة":"Name of Vehicle or Tools",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك قم بادخال اسم ';
                        }
                      },
                    ),
                  ),
                  horizontalSpace(5),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsManager.mainRed
                    ),
                    child: IconButton(
                        onPressed: () {
                          context.pushNamed(Routes.searachVehicleResult,
                          arguments:context.read<VehicleCubit>().searchNameController.text
                          );
                        },
                        icon: const Icon(Icons.send,
                        color: Colors.white,
          
                        )),
                  ),
                ],
              ),
              verticalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     HomeCubit.get(context).isArabic?
                  "أقتراحات :":'Suggetions :',
                  style: TextStyles.font15BlackBold,
                  ),
                  GoldAdsWidget()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
