import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/drop_down_button_list.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/location_provider.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/widgets/app_text_form_field.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';


class AddToolsFields extends StatefulWidget {
  const AddToolsFields({super.key});

  @override
  State<AddToolsFields> createState() => _AddToolsFieldsState();
}

class _AddToolsFieldsState extends State<AddToolsFields> {


  @override
  void initState() {
    super.initState();

  }

  String type2Value = ApiConstants.forSale;
  var type2List = [
    ApiConstants.forSale,
    ApiConstants.rent,
    ApiConstants.wanted,
  ];

   String type3Value = ApiConstants.used;
  var type3List = [
    ApiConstants.used,
    ApiConstants.New,
  ];

  String type4Value = ApiConstants.reqular;
  var type4List = [
    ApiConstants.reqular,
    ApiConstants.immediateBuy,
    ApiConstants.immediateSale,
  ];



    String countryValue = CountryNames.emarates;
  var countryList = [
    CountryNames.emarates,
    CountryNames.elSaudia,
    CountryNames.qatar,
    CountryNames.elBahrin,
    // CountryNames.iraq,
    CountryNames.kewait,
    CountryNames.oman,
  ];


  @override
  Widget build(BuildContext context) {

    return Form(
      key: context.read<VehicleCubit>().formKey,
      child: Column(
        children: [

          ///full name
          AppTextFormField(
            hintText: 'اسم الاداة',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اسم الاداره ';
              }
            },
            controller: context.read<VehicleCubit>().titleController,
          ),

          verticalSpace(20),
          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().type2Controller,
          //   list: type2List,
          //   listValue: type2Value,
          //   lableText: 'نوع الاداة ',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),
          DropdownButtonFormField<String>(
            value: type2Value,
            onChanged: (String? newValue) {
              // Update the selected value
              context.read<VehicleCubit>().type2Controller.text = newValue ?? '';
            },
            items: type2List.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'نوع الاداة',
              labelStyle: TextStyles.font14DarkBlueMedium,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(30),
              ), // You can customize the border style here
            ),
          ),

          verticalSpace(20),
          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().type3Controller,
          //   list: type3List,
          //   listValue: type3Value,
          //   lableText: 'حالة الاداة',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),
          DropdownButtonFormField<String>(
            value: type3Value,
            onChanged: (String? newValue) {
              // Update the selected value
              context.read<VehicleCubit>().type3Controller.text = newValue ?? '';
            },
            items: type3List.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'حالة الاداة',
              labelStyle: TextStyles.font14DarkBlueMedium,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(30),
              ), // You can customize the border style here
            ),
          ),

          
          verticalSpace(20),
          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().type4Controller,
          //   list: type4List,
          //   listValue: type4Value,
          //   lableText: 'حالة البيع او الشراء',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),
          DropdownButtonFormField<String>(
            value: type4Value,
            onChanged: (String? newValue) {
              // Update the selected value
              context.read<VehicleCubit>().type4Controller.text = newValue ?? '';
            },
            items: type4List.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'حالة البيع او الشراء',
              labelStyle: TextStyles.font14DarkBlueMedium,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(30),
              ), // You can customize the border style here
            ),
          ),
          verticalSpace(20),

            ///price
          AppTextFormField(
            hintText: 'سعر الاداة',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل سعر الاداه';
              }
            },
            controller: context.read<VehicleCubit>().priceController,
          ),
          verticalSpace(20),

             ///phone
          AppTextFormField(
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل رقم الهاتف';
              }
            },
            controller: context.read<VehicleCubit>().phoneNumberController,
          ),
          verticalSpace(20),

               ///whatsapp
          AppTextFormField(
            hintText: 'رقم الواتساب',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل رقم الواتساب';
              }
            },
            controller: context.read<VehicleCubit>().whatsAppNumberController,
          ),
          verticalSpace(20),

         

          ///description
          AppTextFormField(
            hintText: ' الوصف',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الوصف';
              }
            },
            controller: context.read<VehicleCubit>().descriptionController,
          ),
          verticalSpace(20),
          //warranty
          AppTextFormField(
            hintText: ' الضمان',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الضمان';
              }
            },
            controller: context.read<VehicleCubit>().warrantyController,
          ),

          verticalSpace(20),
          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().countryController,
          //   list: countryList,
          //   listValue: countryValue,
          //   lableText: 'الدولة',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),
          DropdownButtonFormField<String>(
            value: countryValue,
            onChanged: (String? newValue) {
              // Update the selected value
              context.read<VehicleCubit>().countryController.text = newValue ?? '';
            },
            items: countryList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'الدولة',
              labelStyle: TextStyles.font14DarkBlueMedium,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(30),
              ), // You can customize the border style here
            ),
          ),
          verticalSpace(20),

          AppTextFormField(
            hintText: 'المدينة',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل المدينه';
              }
            },
            controller: context.read<VehicleCubit>().cityController,
          ),
          verticalSpace(20),


          // //ads type
          // AppTextFormField(
          //   hintText: 'نوع الباقة',
          //   keyboardType: TextInputType.text,
          //   validator: (value) {
          //     if (value == null ||
          //         value.isEmpty ) {
          //       return 'Please enter a ads type';
          //     }
          //   },
          //   controller: context.read<VehicleCubit>().adsTypeController,
          // ),
          // verticalSpace(5),



         

                    //year make
          AppTextFormField(
            hintText: ' سنة الصنع',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل سنه الصنع';
              }
            },
            controller: context.read<VehicleCubit>().yearMakeController,
          ),
          verticalSpace(20),

          


                    //addones
          AppTextFormField(
            hintText: 'الاضافات',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الاضافات';
              }
            },
            controller: context.read<VehicleCubit>().addOnsController,
          ),
          verticalSpace(20),
          //PublicStatus
          AppTextFormField(
            hintText: 'الحاله العامه',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الحاله العامه';
              }
            },
            controller: context.read<VehicleCubit>().publicStatusController,
          ),
          verticalSpace(20),

            //Security
          AppTextFormField(
            hintText: 'متطلبات الامان',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل متطلبات الامان';
              }
            },
            controller: context.read<VehicleCubit>().securityController,
          ),
          verticalSpace(20),

           //Specifications
          AppTextFormField(
            hintText: 'الوصف',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الوصف';
              }
            },
            controller: context.read<VehicleCubit>().specificationsController,
          ),
          verticalSpace(20),

                     //Size
          AppTextFormField(
            hintText: 'الحجم',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الحجم';
              }
            },
            controller: context.read<VehicleCubit>().sizeController,
          ),
          verticalSpace(20),


          FloatingActionButton.extended(
              backgroundColor: Colors.white,
              onPressed: () {
                getLocation();
              },
              icon: const Icon(
                IconlyBold.location,
                color: ColorsManager.mainRed,
              ),
              label: Text(
                HomeCubit.get(context).isArabic
                    ? "احصل علي الموقع "
                    : 'Get location',
                style: TextStyles.font15MainRed,
              )),
          verticalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'خطوط العرض : ',
                    style: TextStyles.font15MainRed,
                  ),
                  const Spacer(),
                  Text(
                    latitude.toString(),
                    style: TextStyles.font13BlackBold,
                  ),
                ],
              ),
              verticalSpace(5),
              Row(
                children: [
                  Text(
                    'خطوط الطول : ',
                    style: TextStyles.font15MainRed,
                  ),
                  const Spacer(),
                  Text(
                    longitude.toString(),
                    style: TextStyles.font13BlackBold,
                  ),
                ],
              ),
            ],
          )
                           
      

        ],
      ),
    );
  
  }
MyLocationProvider myLocationProvider = MyLocationProvider();
  double? latitude = 0;
  double? longitude = 0;
  
   void getLocation() async {
    var locationData = await myLocationProvider.getLocation();
    context.read<VehicleCubit>().latitude = locationData!.latitude;
    context.read<VehicleCubit>().longitude = locationData.longitude;
    setState(() {
      latitude = context.read<VehicleCubit>().latitude;
      longitude = context.read<VehicleCubit>().longitude;
    });
    Constants.showToast(msg: "تم أخذ الموقع بنجاح");
  }

}