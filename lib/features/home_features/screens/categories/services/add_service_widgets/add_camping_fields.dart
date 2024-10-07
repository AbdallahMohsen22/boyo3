import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/drop_down_button_list.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/auth_features/register/widgets/location_provider.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/network/api_constants.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';


class AddCampingFields extends StatefulWidget {
  const AddCampingFields({super.key});

  @override
  State<AddCampingFields> createState() => _AddCampingFieldsState();
}

class _AddCampingFieldsState extends State<AddCampingFields> {

  @override
  void initState() {
    super.initState();

  }


  // String type1Value = ApiConstants.camping;
  // var type1List = [
  //   ApiConstants.camping,
  //   ApiConstants.maintenance,
  //   ApiConstants.rent,
  //   ApiConstants.transfer,
  //   ApiConstants.washing,
  //   ApiConstants.wasteDispol,
  //   ApiConstants.waterFilling,
  // ];

  MyLocationProvider myLocationProvider = MyLocationProvider();
  double? latitude = 0;
  double? longitude = 0;

  // String type2Value = ApiConstants.workShop;
  // var type2List = [
  //   ApiConstants.workShop,
  //   ApiConstants.exhibition,
  // ];

  //  String type3Value = ApiConstants.forHome;
  // var type3List = [
  //   ApiConstants.forHome,
  //   ApiConstants.out,
  // ];

  // String type4Value = ApiConstants.reqular;
  // var type4List = [
  //   ApiConstants.reqular,
  //   ApiConstants.immediateBuy,
  //   ApiConstants.immediateSale,
  // ];



  // String countryValue = "الأمارات";
  // var countryList = [
  //    "الأمارات",
  //   "السعودية",
  //   "قطر",
  //   "البحرين",
  //   "عمان",
  //   "الكوبت",
  //   "العراق",
  //
  // ];

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
      key: context.read<ServiceCubit>().formKey,
      child: Column(
        children: [

          ///full name
          AppTextFormField(
            hintText: 'اسم مكان التخييم',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل الاسم';
              }
            },
            controller: context.read<ServiceCubit>().titleController,
          ),

          // verticalSpace(10),
          // DropDownButtonList(
          //   controller: context.read<ServiceCubit>().typeController,
          //   list: type1List,
          //   listValue: type1Value,
          //   lableText: 'نوع الخدمة ',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),

          verticalSpace(20),
          //  DropDownButtonList(
          //   controller: context.read<ServiceCubit>().type3Controller,
          //   list: type2List,
          //   listValue: type2Value,
          //   lableText: 'نوع الخدمة ',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),

          // DropDownButtonList(
          //   controller: context.read<ServiceCubit>().type3Controller,
          //   list: type3List,
          //   listValue: type3Value,
          //   lableText:  'مكان الخدمة ',
          //   lableStyle: TextStyles.font14DarkBlueMedium,
          // ),

          
          // verticalSpace(10),
         

            ///price
          AppTextFormField(
            hintText: 'السعر',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل السعر';
              }
            },
            controller: context.read<ServiceCubit>().priceController,
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
            controller: context.read<ServiceCubit>().phoneNumberController,
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
            controller: context.read<ServiceCubit>().whatsAppNumberController,
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
            controller: context.read<ServiceCubit>().descriptionController,
          ),
          // verticalSpace(5),
          //warranty
          // AppTextFormField(
          //   hintText: ' الضمان',
          //   keyboardType: TextInputType.text,
          //   validator: (value) {
          //     if (value == null ||
          //         value.isEmpty ) {
          //       return 'Please enter a valid warranty';
          //     }
          //   },
          //   controller: context.read<ServiceCubit>().warrantyController,
          // ),

          verticalSpace(20),
          DropDownButtonList(
            controller: context.read<ServiceCubit>().countryController,
            list: countryList,
            listValue: countryValue,
            lableText: 'الدولة',
            lableStyle: TextStyles.font14DarkBlueMedium,
          ),
          verticalSpace(20),
            AppTextFormField(
            hintText: "المدينة",
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل المدينه';
              }
            },
            controller: context.read<ServiceCubit>().cityController,
          ),
          verticalSpace(20),

          
          //PublicStatus
          AppTextFormField(
            hintText: 'عدد الايام',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل عدد الايام';
              }
            },
            controller: context.read<ServiceCubit>().countDayController,
          ),
          verticalSpace(20),
         
          //PublicStatus
          AppTextFormField(
            hintText: 'عدد الاشخاص',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل عدد الاشخاص';
              }
            },
            controller: context.read<ServiceCubit>().countPersonController,
          ),
          verticalSpace(20),

            //Security
          AppTextFormField(
            hintText: 'من دوله',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل المدينه';
              }
            },
            controller: context.read<ServiceCubit>().fromCountryController,
          ),
          verticalSpace(20),

                     //Size
          AppTextFormField(
            hintText: 'الي دوله',
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'من فضلك ادخل المدينه';
              }
            },
            controller: context.read<ServiceCubit>().toCountryController,
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
                    ? "احصل علي موقع الخدمة"
                    : 'Get Service location',
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
  
   void getLocation() async {
    var locationData = await myLocationProvider.getLocation();
    context.read<ServiceCubit>().latitude = locationData!.latitude;
    context.read<ServiceCubit>().longitude = locationData.longitude;
    setState(() {
      latitude = context.read<ServiceCubit>().latitude;
      longitude = context.read<ServiceCubit>().longitude;
    });
    Constants.showToast(msg: "تم أخذ الموقع بنجاح");
  }

}