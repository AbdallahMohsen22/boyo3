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

class CampingWidget extends StatefulWidget {
  CampingWidget({super.key});

  @override
  State<CampingWidget> createState() => _CampingWidgetState();
}

class _CampingWidgetState extends State<CampingWidget> {
  @override
  void initState() {
    getAllForCampingService(context);
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
                    const Icon(
                    IconlyBold.filter,
                    size: 22,
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
                            CountryNames.emarates,
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          const Icon(
                            IconlyLight.filter,
                          )
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
                          const Icon(
                            IconlyLight.filter,
                          )
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
                          const Icon(
                            IconlyLight.filter,
                          )
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
                          const Icon(
                            IconlyLight.filter,
                          )
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
                            "الكل",
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          const Icon(
                            IconlyLight.filter,
                          )
                        ],
                      ),
                      onTap: () {
                         setState(() {
                          getAllForCampingService(
                              context
                              );
                        });
                      },
                    ),
                 
                  ];
                }),
         verticalSpace(10),

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
                                    : ColorsManager.mainRed),
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

  void getAllForCampingService(BuildContext context) {
    context.read<ServiceCubit>().emitGetAllService(
          service: ApiConstants.camping,
        );
  }
  
    void getServiceByCountry(BuildContext context,String country) {
    context.read<ServiceCubit>().emitGetServiceByCountry(
          servName: ApiConstants.camping,
          country: country
        );
  }
}
