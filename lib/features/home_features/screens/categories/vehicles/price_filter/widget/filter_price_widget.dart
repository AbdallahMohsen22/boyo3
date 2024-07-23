import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/widgets/app_text_form_field.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPriceFields extends StatefulWidget {
  const FilterPriceFields({super.key});

  @override
  State<FilterPriceFields> createState() => _FilterPriceFieldsState();
}

class _FilterPriceFieldsState extends State<FilterPriceFields> {


  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<VehicleCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Min Price',
            validator: (value) {
              if (value == null ||
                  value.isEmpty) {
                return 'Please enter a valid Min Price';
              }
            },
            controller: context.read<VehicleCubit>().minPriceController,
          ),
          verticalSpace(18),
         AppTextFormField(
            hintText: 'Max Price',
            validator: (value) {
              if (value == null ||
                  value.isEmpty) {
                return 'Please enter a valid Max Price';
              }
            },
            controller: context.read<VehicleCubit>().maxPriceController,
          ),
     
        ],
      ),
    );
  }

 

}