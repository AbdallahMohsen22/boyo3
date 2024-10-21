import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_state.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';

class RentWidget extends StatefulWidget {
  RentWidget({super.key});

  @override
  State<RentWidget> createState() => _RentWidgetState();
}

class _RentWidgetState extends State<RentWidget> {
  @override
  void initState() {
    getAllForMainRentService(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         verticalSpace(10),
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
                          getAllForMainRentService(
                              context
                          );
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
                          getServiceByCountry(
                              context,CountryNames.emarates);
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
                          getServiceByCountry(
                              context,CountryNames.elSaudia);
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
                          getServiceByCountry(
                              context,CountryNames.qatar);
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
                          getServiceByCountry(
                              context,CountryNames.elBahrin
                          );
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
                          getServiceByCountry(
                              context,CountryNames.kewait
                          );
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
                          getServiceByCountry(
                              context,CountryNames.oman
                          );
                        });
                      },
                    ),



                  ];
                }),
         
        BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, ServiceState state) {
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
                                    : ColorsManager.mainRed
                                    ),
                          );
                        })
                  ],
                ),
              ),
            );
          }, success: (getAllServiceResponse) {
            return ListView.builder(
                itemCount: getAllServiceResponse.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ServiceWidget(serviceModel: getAllServiceResponse[index]);
                });
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
    );
  }

  void getAllForMainRentService(BuildContext context) {
    context.read<ServiceCubit>().emitGetAllService(
          service: ApiConstants.rent,
        );
  }

   void getServiceByCountry(BuildContext context,String country) {
    context.read<ServiceCubit>().emitGetServiceByCountry(
          servName: ApiConstants.rent,
          country: country
        );
  }
}
