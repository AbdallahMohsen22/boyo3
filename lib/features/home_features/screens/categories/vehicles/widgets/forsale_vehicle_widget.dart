import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/vehicle_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';

class ForSaleVehicleWidget extends StatefulWidget {
  final String type1;

  ForSaleVehicleWidget({super.key, required this.type1});

  @override
  State<ForSaleVehicleWidget> createState() => _ForSaleVehicleWidgetState();
}

class _ForSaleVehicleWidgetState extends State<ForSaleVehicleWidget> {
  @override
  void initState() {
    //getAllForSaleCaravanFilterById(context, CountryNames.emarates);
    getAllForSaleCaravan(context);
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   context.read<VehicleCubit>().close();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     ///الدوله
          //     PopupMenuButton(
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          //           child: Row(
          //             children: [
          //               const Icon(
          //                 IconlyBold.filter,
          //                 size: 22,
          //               ),
          //               horizontalSpace(5),
          //               Text(
          //                 HomeCubit.get(context).isArabic
          //                     ? "الدولة"
          //                     : "Country",
          //                 style: TextStyles.font15MainRed,
          //               )
          //             ],
          //           ),
          //         ),
          //         itemBuilder: (BuildContext context) {
          //           return [
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     "الكل",
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravan(context);
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     CountryNames.emarates,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravanFilterByCountry(
          //                       context, CountryNames.emarates);
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     CountryNames.elSaudia,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravanFilterByCountry(
          //                       context, CountryNames.elSaudia);
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     CountryNames.qatar,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravanFilterByCountry(
          //                       context, CountryNames.qatar);
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     CountryNames.elBahrin,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravanFilterByCountry(
          //                       context, CountryNames.elBahrin);
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     CountryNames.kewait,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravanFilterByCountry(
          //                       context, CountryNames.kewait);
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     CountryNames.oman,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   getAllForSaleCaravanFilterByCountry(
          //                       context, CountryNames.oman);
          //                 });
          //               },
          //             ),
          //
          //           ];
          //         }),
          //
          //     ///المدينه
          //     // PopupMenuButton(
          //     //     child: Padding(
          //     //       padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          //     //       child: Row(
          //     //         children: [
          //     //           const Icon(
          //     //             IconlyBold.filter,
          //     //             size: 22,
          //     //           ),
          //     //           horizontalSpace(5),
          //     //           Text(
          //     //             HomeCubit.get(context).isArabic
          //     //                 ? "المدينه"
          //     //                 : "city",
          //     //             style: TextStyles.font15MainRed,
          //     //           )
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     itemBuilder: (BuildContext context) {
          //     //       return [
          //     //         PopupMenuItem(
          //     //           child: Row(
          //     //             children: [
          //     //               Text(
          //     //                 "الوكره",
          //     //                 style: TextStyles.font15BlackBold,
          //     //               ),
          //     //               const Spacer(),
          //     //               const Icon(
          //     //                 IconlyLight.filter,
          //     //               )
          //     //             ],
          //     //           ),
          //     //           onTap: () {
          //     //             setState(() {
          //     //               // getAllForSaleCaravanFilterByCity(
          //     //               //     context, CountryNames.wakra);
          //     //             });
          //     //           },
          //     //
          //     //         ),
          //     //         PopupMenuItem(
          //     //           child: Row(
          //     //             children: [
          //     //               Text(
          //     //                 CountryNames.elSaudia,
          //     //                 style: TextStyles.font15BlackBold,
          //     //               ),
          //     //               const Spacer(),
          //     //               const Icon(
          //     //                 IconlyLight.filter,
          //     //               )
          //     //             ],
          //     //           ),
          //     //           onTap: () {
          //     //             setState(() {
          //     //               getAllForSaleCaravanFilterByCountry(
          //     //                   context, CountryNames.elSaudia);
          //     //             });
          //     //           },
          //     //         ),
          //     //         PopupMenuItem(
          //     //           child: Row(
          //     //             children: [
          //     //               Text(
          //     //                 CountryNames.qatar,
          //     //                 style: TextStyles.font15BlackBold,
          //     //               ),
          //     //               const Spacer(),
          //     //               const Icon(
          //     //                 IconlyLight.filter,
          //     //               )
          //     //             ],
          //     //           ),
          //     //           onTap: () {
          //     //             setState(() {
          //     //               getAllForSaleCaravanFilterByCountry(
          //     //                   context, CountryNames.qatar);
          //     //             });
          //     //           },
          //     //         ),
          //     //         PopupMenuItem(
          //     //           child: Row(
          //     //             children: [
          //     //               Text(
          //     //                 CountryNames.elBahrin,
          //     //                 style: TextStyles.font15BlackBold,
          //     //               ),
          //     //               const Spacer(),
          //     //               const Icon(
          //     //                 IconlyLight.filter,
          //     //               )
          //     //             ],
          //     //           ),
          //     //           onTap: () {
          //     //             setState(() {
          //     //               getAllForSaleCaravanFilterByCountry(
          //     //                   context, CountryNames.elBahrin);
          //     //             });
          //     //           },
          //     //         ),
          //     //         PopupMenuItem(
          //     //           child: Row(
          //     //             children: [
          //     //               Text(
          //     //                 "الكل",
          //     //                 style: TextStyles.font15BlackBold,
          //     //               ),
          //     //               const Spacer(),
          //     //               const Icon(
          //     //                 IconlyLight.filter,
          //     //               )
          //     //             ],
          //     //           ),
          //     //           onTap: () {
          //     //             setState(() {
          //     //               getAllForSaleCaravan(context);
          //     //             });
          //     //           },
          //     //         ),
          //     //       ];
          //     //     }),
          //
          //     /// ألحاله
          //     PopupMenuButton(
          //         child: Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          //           child: Row(
          //             children: [
          //               const Icon(
          //                 IconlyBold.filter,
          //                 size: 22,
          //               ),
          //               horizontalSpace(5),
          //               Text(
          //                 HomeCubit.get(context).isArabic
          //                     ? "الحالة"
          //                     : "Condition",
          //                 style: TextStyles.font15MainRed,
          //               )
          //             ],
          //           ),
          //         ),
          //         itemBuilder: (BuildContext context) {
          //           return [
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     ApiConstants.New,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   filterAdsByVehicleType1AndType2AndType3(
          //                     context,
          //                     ApiConstants.New,
          //                   );
          //                 });
          //               },
          //             ),
          //             PopupMenuItem(
          //               child: Row(
          //                 children: [
          //                   Text(
          //                     ApiConstants.used,
          //                     style: TextStyles.font15BlackBold,
          //                   ),
          //                   const Spacer(),
          //                   const Icon(
          //                     IconlyLight.filter,
          //                   )
          //                 ],
          //               ),
          //               onTap: () {
          //                 setState(() {
          //                   filterAdsByVehicleType1AndType2AndType3(
          //                     context,
          //                     ApiConstants.used,
          //                   );
          //                 });
          //               },
          //             ),
          //           ];
          //         }),
          //
          //     ///السعر
          //
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          //       child: InkWell(
          //         onTap: () {
          //           context.pushNamed(Routes.filterPriceVehiclesScreen);
          //         },
          //         child: Row(
          //           children: [
          //             const Icon(
          //               IconlyBold.filter,
          //               size: 22,
          //             ),
          //             horizontalSpace(5),
          //             Text(
          //               HomeCubit.get(context).isArabic ? "السعر" : "Price",
          //               style: TextStyles.font15MainRed,
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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
              if (getAllVehicleResponse.length != 0) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: getAllVehicleResponse.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VehiclesWidget(
                          vehicleModel: getAllVehicleResponse[index]);
                    });
              } else {
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
                      verticalSpace(10),
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
      ),
    );
  }

  void getAllForSaleCaravan(BuildContext context) {
    context.read<VehicleCubit>().emitGetAllVehicles(
          type1: widget.type1,
          type2: ApiConstants.forSale,
        );
  }

  void filterAdsByVehicleType1AndType2AndType3(
      BuildContext context, String vehicleCondition) {
    context.read<VehicleCubit>().filterAdsByVehicleType1AndType2AndType3(
          vehicleType: widget.type1,
          type2: ApiConstants.forSale,
          vehicleCondition: vehicleCondition,
        );
  }

  void getAllForSaleCaravanFilterByCountry(
      BuildContext context, String country) {
    context.read<VehicleCubit>().filterAdsByVehicleType1AndType2AndCountry(
          vehicleType: widget.type1,
          type2: ApiConstants.forSale,
          country: country,
        );
  }

  // void getAllForSaleCaravanFilterByCity(
  //     BuildContext context, String city) {
  //   context.read<VehicleCubit>().filterAdsByVehicleType1AndType2AndCity(
  //     vehicleType: widget.type1,
  //     type2: ApiConstants.forSale,
  //     city: city,
  //   );
  // }
}
