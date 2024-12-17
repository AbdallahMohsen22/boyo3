import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/vehicle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../core/network/api_constants.dart';

class WantedVehiclesWidget extends StatefulWidget {
  final String type1;
  WantedVehiclesWidget({super.key, required this.type1});

  @override
  State<WantedVehiclesWidget> createState() => _WantedVehiclesWidgetState();
}

class _WantedVehiclesWidgetState extends State<WantedVehiclesWidget> {
  @override
  void initState() {
    getAllWantedCaravan(context);
    super.initState();
  }

  String countryValue = CountryNames.emarates;
  var countryList = [
    CountryNames.emarates,
    CountryNames.elSaudia,
    CountryNames.qatar,
    CountryNames.elBahrin
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //country 
            PopupMenuButton(
               child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: Row(children: 
                  [
                    Image.asset(
                      'assets/images/country_icon.png',
                      width: 20.h,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  horizontalSpace(5),
                   Text(
                    HomeCubit.get(context).isArabic?
                    "الدولة":
                    "Contry",
                    style: TextStyles.font15MainRed,
                    )
                  ],),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    ///getAllWantedCaravanFilterById
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            "الكل",
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/country_icon.png',
                            width: 20.h,
                            height: 20.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravan(context);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            CountryNames.emarates,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/emirates_icon.png',
                            width: 30.h,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravanFilterById(
                              context, CountryNames.emarates);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            CountryNames.elSaudia,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/sudia_icon.png',
                            width: 30.h,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravanFilterById(
                              context, CountryNames.elSaudia);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            CountryNames.qatar,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/qatar_icon.png',
                            width: 30.h,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravanFilterById(
                              context, CountryNames.qatar);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            CountryNames.elBahrin,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/bahrain_icon.png',
                            width: 30.h,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravanFilterById(
                              context, CountryNames.elBahrin);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            CountryNames.kewait,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/kuwait_icon.png',
                            width: 30.h,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravanFilterById(
                              context, CountryNames.kewait);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            CountryNames.oman,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/oman_icon.png',
                            width: 30.h,
                            height: 30.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          getAllWantedCaravanFilterById(
                              context, CountryNames.oman);
                        });
                      },
                    ),
                 
                  ];
                }),
            // ألحاله 
             PopupMenuButton(
                
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: Row(children: 
                  [
                    Image.asset(
                      'assets/images/status_icon.png',
                      width: 20.h,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  horizontalSpace(5),
                   Text(
                    HomeCubit.get(context).isArabic?
                    "الحالة":
                    "Condition",
                    style: TextStyles.font15MainRed,
                    )
                  ],),
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            ApiConstants.New,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/new_icon.png',
                            width: 20.h,
                            height: 20.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                         filterAdsByVehicleType1AndType2AndType3(
                              context,ApiConstants.New,);
                        });
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            ApiConstants.used,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/images/used_icon.png',
                            width: 20.h,
                            height: 20.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      onTap: () {
                         setState(() {
                          filterAdsByVehicleType1AndType2AndType3(
                              context,ApiConstants.used,);
                        });
                      },
                    ),
              
                  ];
                }),
            

            //price 
             Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(Routes.filterPriceVehiclesScreen);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/dollar_icon.png',
                        width: 20.h,
                        height: 20.h,
                        fit: BoxFit.cover,
                      ),
                      horizontalSpace(5),
                      Text(
                        HomeCubit.get(context).isArabic ? "السعر" : "Price",
                        style: TextStyles.font15MainRed,
                      )
                    ],
                  ),
                ),
              ),
         

          ],
        ),
        BlocBuilder<VehicleCubit, VehicleState>(
            builder: (context, VehicleState state) {
          return state.when(initial: () {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpinKitThreeBounce(
                        size: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                color: index.isEven
                                    ? ColorsManager.mainRed
                                    : ColorsManager.mainRed),
                          );
                        })
                  ],
                ),
              ),
            );
          }, loading: () {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpinKitThreeBounce(
                        size: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                color: index.isEven
                                    ? ColorsManager.mainRed
                                    : ColorsManager.mainRed),
                          );
                        })
                  ],
                ),
              ),
            );
          }, success: (getAllVehicleResponse) {
            if(getAllVehicleResponse.length != 0 ){
                  return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: getAllVehicleResponse.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return VehiclesWidget(
                        vehicleModel: getAllVehicleResponse[index]);
                  });
              
                  }
                else {
                  return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyBold.paper,
                        size: 150,
                      ),
                      verticalSpace(10),
                      Text(
                        'NO Data Added Here',
                        style: TextStyles.font15BlackBold,
                      ),
                    ],
                  ),
                ),
              );
           
                }
            }, error: (error) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      size: 150,
                    ),
                    Text(
                      'Something went wrong , please try again later ',
                      style: TextStyles.font15BlackBold,
                    ),
                  ],
                ),
              ),
            );
          });
        }),
      ],
    );
  }

  void getAllWantedCaravan(BuildContext context) {
    context.read<VehicleCubit>().emitGetAllVehicles(
          type1: widget.type1,
          type2: ApiConstants.wanted,
        );
  }

  void getAllWantedCaravanFilterById(BuildContext context, String country) {
    context.read<VehicleCubit>().filterAdsByVehicleType1AndType2AndCountry(
          vehicleType: widget.type1,
          type2: ApiConstants.wanted,
          country: country,
        );
  }

  
  void filterAdsByVehicleType1AndType2AndType3(BuildContext context, String vehicleCondition) {
    context.read<VehicleCubit>().filterAdsByVehicleType1AndType2AndType3(
          vehicleType: widget.type1,
          type2: ApiConstants.wanted,
          vehicleCondition: vehicleCondition,
        );
  }
}
