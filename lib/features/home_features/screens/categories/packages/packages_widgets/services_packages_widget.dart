import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_state.dart';
import 'package:boyo3_v1/features/home_features/widget/service_package_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ServicePackageWidget extends StatefulWidget {
  const ServicePackageWidget({super.key});

  @override
  State<ServicePackageWidget> createState() => _ServicePackageWidgetState();
}

class _ServicePackageWidgetState extends State<ServicePackageWidget> {
  @override
  void initState() {
    getAllAdsPackages(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesPackagesCubit, ServicePackagesState>(
        builder: (context, ServicePackagesState state) {
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
      }, success: (getServicesPackageResponse) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Column(
              children: [
                 Padding(
                            padding:EdgeInsets.only(top :8.0.h),
                            child: Text(
                                HomeCubit.get(context).isArabic
                                ? "الباقات التجارية "
                                : "Commercial Packages",
                              style: TextStyles.font18BlackBold,
                            ),
                          ),
                          
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0
                        )
                      ),
                    child: ListView.builder(
                      itemCount: getServicesPackageResponse.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PackageWidgetForService(packageModel: getServicesPackageResponse[index],
                          index:  index,
                        );
                      }),
                ),
              ],
            ),
          );
        
        // return PackageWidgetForService(packageModel: getAdsPackageResponse[0]);
      }, error: (error) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_rounded,
                  size: 200,
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
    });
  }

  void getAllAdsPackages(BuildContext context) {
    context.read<ServicesPackagesCubit>().emitGetAllPackagesStates();
  }
}
