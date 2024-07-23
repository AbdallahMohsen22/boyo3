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


class AddMotorCyclesFields extends StatefulWidget {
  const AddMotorCyclesFields({super.key});

  @override
  State<AddMotorCyclesFields> createState() => _AddMotorCyclesFieldsState();
}

class _AddMotorCyclesFieldsState extends State<AddMotorCyclesFields> {

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
    CountryNames.iraq,
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
            hintText: 'اسم الدراجة النارية',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اسم الدراجه';
              }
            },
            controller: context.read<VehicleCubit>().titleController,
          ),

          verticalSpace(10),
          DropDownButtonList(
            controller: context.read<VehicleCubit>().type2Controller,
            list: type2List,
            listValue: type2Value,
            lableText: 'نوع الدراجة النارية',
            lableStyle: TextStyles.font14DarkBlueMedium,
          ),

          verticalSpace(10),
          DropDownButtonList(
            controller: context.read<VehicleCubit>().type3Controller,
            list: type3List,
            listValue: type3Value,
            lableText: 'حالة الدراجة النارية',
            lableStyle: TextStyles.font14DarkBlueMedium,
          ),

          
          verticalSpace(10),
          DropDownButtonList(
            controller: context.read<VehicleCubit>().type4Controller,
            list: type4List,
            listValue: type4Value,
            lableText: 'حالة البيع او الشراء',
            lableStyle: TextStyles.font14DarkBlueMedium,
          ),
          verticalSpace(10),

            ///price
          AppTextFormField(
            hintText: 'سعر الدراجة النارية',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل سعر الدراجه الناريه';
              }
            },
            controller: context.read<VehicleCubit>().priceController,
          ),
          verticalSpace(5),

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
          verticalSpace(5),

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
          verticalSpace(5),

         

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
          verticalSpace(5),
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

          verticalSpace(10),
          DropDownButtonList(
            controller: context.read<VehicleCubit>().countryController,
            list: countryList,
            listValue: countryValue,
            lableText: 'الدولة',
            lableStyle: TextStyles.font14DarkBlueMedium,
          ),
          verticalSpace(5),

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
          verticalSpace(5),


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



          //color out
          AppTextFormField(
            hintText: 'اللون الخارجي',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل اللون الخارجي';
              }
            },
            controller: context.read<VehicleCubit>().colorOutController,
          ),
          verticalSpace(5),

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
          verticalSpace(5),

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
          verticalSpace(5),

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
          verticalSpace(5),

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
          verticalSpace(5),
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
          verticalSpace(5),

            //Security
          AppTextFormField(
            hintText: 'متطلبات الامان',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الامان';
              }
            },
            controller: context.read<VehicleCubit>().securityController,
          ),
          verticalSpace(5),

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
          verticalSpace(5),

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
          verticalSpace(5),

          verticalSpace(15),
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
                    'خطوط الطول : ',
                    style: TextStyles.font15MainRed,
                  ),
                  const Spacer(),
                  Text(
                    latitude.toString(),
                    style: TextStyles.font13BlackBold,
                  ),
                ],
              ),
              verticalSpace(3),
              Row(
                children: [
                  Text(
                    'خطوط العرض : ',
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