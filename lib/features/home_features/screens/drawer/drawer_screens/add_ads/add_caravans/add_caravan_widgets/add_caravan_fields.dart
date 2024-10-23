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


class AddCaravanFields extends StatefulWidget {
  const AddCaravanFields({super.key});

  @override
  State<AddCaravanFields> createState() => _AddCaravanFieldsState();
}

class _AddCaravanFieldsState extends State<AddCaravanFields> {

  @override
  void initState() {
    super.initState();

  }

  bool isVisable=true;
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

  String type4Value =ApiConstants.reqular;
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

  String emaratesCitiesValue = CountryNames.emarates;
  var emaratesCitiesList = [
    CountryNames.emarates,

  ];

  String elSaudiaCitiesValue = CountryNames.elSaudia;
  var elSaudiaCitiesList = [

    CountryNames.elSaudia,
  ];

  String qatarCitiesValue = CountryNames.qatar;
  var qatarCitiesList = [
    CountryNames.qatar,

  ];

  String elBahrinCitiesValue = CountryNames.elBahrin;
  var elBahrinCitiesList = [
    CountryNames.elBahrin,
  ];

  // String iraqCitiesValue = CountryNames.iraq;
  // var iraqCitiesList = [
  //   CountryNames.iraq,
  //
  // ];

  String kewaitCitiesValue = CountryNames.kewait;
  var kewaitCitiesList = [

    CountryNames.kewait,
  ];

  String omanCitiesValue = CountryNames.oman;
  var omanCitiesList = [
    CountryNames.oman,
  ];

 
  String normalValue = "normal";
    var normalList = [
    "normal",
    "Saylant",

  ];

  @override
  Widget build(BuildContext context) {

    return Form(
      key: context.read<VehicleCubit>().formKey,
      child: Column(
        children: [

          ///full name
          AppTextFormField(
            hintText: 'اسم الكرفان',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اسم متاح';
              }
            },
            controller: context.read<VehicleCubit>().titleController,
          ),

          verticalSpace(20),
          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().type2Controller,
          //   list: type2List,
          //   listValue: type2Value,
          //   lableText: 'نوع الكرفان',
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
            labelText: 'نوع الكرفان',
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
          //   lableText: 'حالة الكرفان',
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
              labelText: 'حالة الكرفان',
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
            hintText: 'سعر الكرفان',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل سعر';
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
                return 'من فضلك ادخل رقم هاتف متاح';
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
                return 'من فضلك ادخل رقم واتساب متاح';
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
          //   list:countryList,
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

          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().cityController,
          //   list:
          //   countryValue==
          //       CountryNames.elSaudia?
          //   elSaudiaCitiesList:countryValue==
          //       CountryNames.oman?omanCitiesList:elBahrinCitiesList,
          //
          //   listValue:
          //   countryValue==
          //       CountryNames.elSaudia?
          //   elSaudiaCitiesValue:countryValue==
          //       CountryNames.oman?omanCitiesValue:elBahrinCitiesValue,
          //
          //   lableText: 'المدينه',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),
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

                    //color in
          AppTextFormField(
            hintText: 'اللون الداخلي',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اللون';
              }
            },
            controller: context.read<VehicleCubit>().colorInController,
          ),
          verticalSpace(20),

          //color out
          AppTextFormField(
            hintText: 'اللون الخارجي',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اللون';
              }
            },
            controller: context.read<VehicleCubit>().colorOutController,
          ),
          verticalSpace(20),

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

          //year make
          AppTextFormField(
            hintText: ' عدد الاسطوانات',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل عدد الاسطوانات';
              }
            },
            controller: context.read<VehicleCubit>().cylindersController,
          ),
          verticalSpace(20),

          //kilometer
          AppTextFormField(
            hintText: 'كم كيلومتر تحرك ',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل عدد الكيلومترات';
              }
            },
            controller: context.read<VehicleCubit>().kilometerController,
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
                return 'من فضلك ادخل الحاله';
              }
            },
            controller: context.read<VehicleCubit>().publicStatusController,
          ),
          verticalSpace(20),

                    //Faults
          AppTextFormField(
            hintText: 'الاعطال في الكرفان',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اعطال الكارافان';
              }
            },
            controller: context.read<VehicleCubit>().faultsController,
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
            hintText: 'مواصفات',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل المواصفات';
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

                               //GeneratorType
          AppTextFormField(
            hintText: 'نوع المولد',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل نوع المولد';
              }
            },
            controller: context.read<VehicleCubit>().generatorTypeController,
          ),
          verticalSpace(20),

                                         //AirConditionType
          AppTextFormField(
            hintText: 'نوع مكيف الهواء',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل نوع مكيف الهواء';
              }
            },
            controller: context.read<VehicleCubit>().airConditionTypeController,
          ),
          verticalSpace(20),

          
                                         //AirConditionSize
          AppTextFormField(
            hintText: 'حجم مكيف الهواء',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل حجم ممكيف الهواء';
              }
            },
            controller: context.read<VehicleCubit>().airConditionSizeController,
          ),
          verticalSpace(20),

                    
                                         //AirConditionCount
          AppTextFormField(
            hintText: 'عدد مكيفات الهواء',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل عدد مكيفات الهواء';
              }
            },
            controller: context.read<VehicleCubit>().airConditionCountController,
          ),

                              
         //NormalOrSaylant
///
          verticalSpace(20),
          // DropDownButtonList(
          //   controller: context.read<VehicleCubit>().normalOrSaylantController,
          //   list: normalList,
          //   listValue: normalValue,
          //   lableText: 'Norrmal Or Saylant',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),

          DropdownButtonFormField<String>(
            value: normalValue,
            onChanged: (String? newValue) {
              // Update the selected value
              context.read<VehicleCubit>().normalOrSaylantController.text = newValue ?? '';
            },
            items: normalList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Norrmal Or Saylant',
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
          // AppTextFormField(
          //   hintText: 'NormalOrSaylant',
          //   keyboardType: TextInputType.text,
          //   validator: (value) {
          //     if (value == null ||
          //         value.isEmpty ) {
          //       return 'Please enter a NormalOrSaylant';
          //     }
          //   },
          //   controller: context.read<VehicleCubit>().normalOrSaylantController,
          // ),
          // verticalSpace(5),

                                                   //NumberOfParson
          AppTextFormField(
            hintText: 'عدد الاشخاص',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل عدد الاشخاص';
              }
            },
            controller: context.read<VehicleCubit>().numberOfParsonController,
          ),
          verticalSpace(20),

          //height
          AppTextFormField(
            hintText: 'الارتفاع',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل ادخل الارتفاع';
              }
            },
            controller: context.read<VehicleCubit>().heightController,
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
          verticalSpace(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'خط العرض : ',
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
                    'خط الطول : ',
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