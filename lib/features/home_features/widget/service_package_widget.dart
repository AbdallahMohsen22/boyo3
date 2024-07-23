import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/utils/dialog_utils.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/data/models/packages/service_package_model.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_screens/service_package_bloc_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/categories/packages/packages_cubit/ads_package_cubit.dart';

class PackageWidgetForService extends StatelessWidget {
  final ServicePackageModel packageModel;
  final int index;

  PackageWidgetForService({super.key, required this.packageModel, required this.index});

  final List colors = [
    ColorsManager.gold,
    ColorsManager.silver,
    ColorsManager.bronze,
    ColorsManager.free,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4, color: Colors.black26, offset: Offset(5, 5))
            ],
            borderRadius: BorderRadius.circular(20),
            gradient:
                const LinearGradient(colors: [Colors.white, Colors.white])),
        child: Column(
          children: [
            /// name and price
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors[index % colors.length],
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40.0.h,
                      width: 40.0.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyBold.star,
                            color: Colors.red,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              HomeCubit.get(context).isArabic
                                  ? "اسم الباقة :"
                                  : "Package Name : ",
                              style: TextStyles.font16BlackBold,
                            ),
                            Text(packageModel.title,
                                style: TextStyles.font17MainRed),
                          ],
                        ),
                        verticalSpace(1),
                        Row(
                          children: [
                            Text(
                              HomeCubit.get(context).isArabic
                                  ? "سعر الباقة :"
                                  : "Package Price : ",
                              style: TextStyles.font16BlackBold,
                            ),
                            Text('${packageModel.price}\t AED',
                                style: TextStyles.font16MainRed),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// attributes
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ///الصلاحيه

                  Row(
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: Text(
                            HomeCubit.get(context).isArabic
                                ? 'الصلاحية:'
                                : 'Validity:',
                            style: TextStyles.font18MainRed),
                      ),
                      Text(
                          HomeCubit.get(context).isArabic
                              ? '${packageModel.validityDay}أيام '
                              : '${packageModel.validityDay} Days',
                          style: TextStyles.font18BlackBold),
                    ],
                  ),
                  verticalSpace(10),

                  /// الاعلانات

                  ///sections
                  Row(
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: Text(
                            HomeCubit.get(context).isArabic
                                ? 'الاقسام:'
                                : 'sections:',
                            style: TextStyles.font18MainRed),
                      ),
                      Text(packageModel.sections.toString(),
                          style: TextStyles.font18BlackBold),
                    ],
                  ),
                  verticalSpace(10),

                  Row(
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: Text(
                            HomeCubit.get(context).isArabic
                                ? 'اعلانات :'
                                : 'Featured Ads:',
                            style: TextStyles.font18MainRed),
                      ),
                      Text(
                          HomeCubit.get(context).isArabic
                              ? '${packageModel.featuredAds} اعلان '
                              : '${packageModel.featuredAds} Ads',
                          style: TextStyles.font18BlackBold),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: GestureDetector(
                      onTap: () async {
                        userId == null || userId == ''
                            ? DialogUtils.showMessage(
                                context,
                                HomeCubit.get(context).isArabic
                                    ? "من فصضلك قم بتسجيل الدخول اولا"
                                    : "Please Signin First",
                                posActionTitle: HomeCubit.get(context).isArabic
                                    ? "نعم"
                                    : "Yes",
                                posAction: () {
                                  context.pushNamed(Routes.loginScreen);
                                },
                                negActionTitle: HomeCubit.get(context).isArabic
                                    ? "لا"
                                    : "No",
                                negAction: () {},
                              )
                            : userAddPackageService(context, 1, userId!);


                      },
                      child: Center(
                        child: Container(
                          height: 35.h,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(5, 5))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                ColorsManager.mainRed,
                                ColorsManager.mainRed,
                              ])),
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? 'اشتري الآن '
                                      : "Buy Now ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold)),
                              horizontalSpace(10),
                              const Icon(
                                Icons.shopping_cart_rounded,
                                color: Colors.white,
                              ),
                              const Spacer(),
                              const ServicesPackagesBlocListener(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //Service package
  void userAddPackageService(
      BuildContext context, int packageId, String userId) async {
    context.read<UserAddServicesPackagesCubit>()
        .emitUserAddPackageStates(packageId: packageId, userId: userId);
    if (context.read<UserAddServicesPackagesCubit>().message !=
        "Already Subscribed") {
      var prefs = await SharedPreferences.getInstance();
      servicePackageId = packageId;
      prefs.setInt('servicePackageId', packageId);
    }
  }
//Ads Package
  void userAddPackageAds(
      BuildContext context, int packageId, String userId) async {
    context.read<AdsPackagesCubit>()
        .emitUserAddPackageStates(packageId: packageId, userId: userId);
    if (context.read<AdsPackagesCubit>().message !=
        "Already Subscribed") {
      var prefs = await SharedPreferences.getInstance();
      adsPackageId = packageId;
      prefs.setInt('adsPackageId', packageId);
    }
  }
}
