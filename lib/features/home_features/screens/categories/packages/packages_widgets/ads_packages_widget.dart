import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/ads_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/widget/package_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../packages_cubit/ads_package_states.dart';

class AdsPackageWidget extends StatefulWidget {
  const AdsPackageWidget({super.key});

  @override
  State<AdsPackageWidget> createState() => _AdsPackageWidgetState();
}

class _AdsPackageWidgetState extends State<AdsPackageWidget> {
  @override
  void initState() {
    getAllAdsPackages(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsPackagesCubit, AdsPackagesState>(
        builder: (context, AdsPackagesState state) {
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
      }, success: (getAdsPackageResponse) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(top :8.0.h),
                child: Text(
                   HomeCubit.get(context).isArabic
                            ? "الباقات الاعلانية"
                            : "Advertising Packages",
                ),
              ),
              Container(
                 decoration: BoxDecoration(
                        color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0
                          )
                        ),
                child: ListView.builder(
                    itemCount: getAdsPackageResponse.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                
                    itemBuilder: (context, index) {
                      //users=testUser;
                      return PackageWidget(packageModel: getAdsPackageResponse[index],
                        index: index,
                      );
                    }),
              ),
            ],
          ),
        );
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
    context.read<AdsPackagesCubit>().emitGetAllPackagesStates();
  }
}
