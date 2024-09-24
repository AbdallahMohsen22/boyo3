import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/font_weight_helper.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/dialog_utils.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(" isAuth >> $isSignIn");
        print(" isAdmin >> $isAdmin");
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.pushNamed(Routes.homeScreen);
                },
                icon: const Icon(
                  IconlyBroken.close_square,
                )),
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.h),
                child: SafeArea(
                  child: ListTileTheme(
                    textColor: ColorsManager.mainRed,
                    iconColor: ColorsManager.mainRed,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0.w, vertical: 3.h),
                      child: Column(
                        children: [
                          const Boyo3Logo(),

                          ///login

                          if (isSignIn != true)
                            Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    context.pushNamed(Routes.loginScreen);
                                  },
                                  leading: const Icon(
                                    IconlyBold.login,
                                  ),
                                  title: Text(
                                    HomeCubit.get(context).isArabic
                                        ? "تسجيل الدخول "
                                        : "Sign in",
                                    style: const TextStyle(
                                      fontWeight: FontWeightHelper.bold,
                                    ),
                                  ),
                                ),
                                ///register
                                ListTile(
                                  onTap: () {
                                    context.pushNamed(Routes.confirmEmail);
                                  },
                                  leading: const Icon(
                                    Icons.app_registration_rounded,
                                  ),
                                  title: Text(
                                    HomeCubit.get(context).isArabic
                                        ? "تسجيل جديد "
                                        : "Register",
                                    style: const TextStyle(
                                      fontWeight: FontWeightHelper.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ///Profile
                          if (isSignIn == true)
                            ListTile(
                              onTap: () {
                                context.pushNamed(Routes.profileScreen);
                              },
                              leading: const Icon(
                                IconlyBold.profile,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? "الصفحة الشخصية"
                                    : "Profile",
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),

                          /// categories
                          ListTile(
                            onTap: () {
                              context.pushNamed(Routes.categoriesScreen);
                            },
                            leading: const Icon(
                              IconlyBold.paper,
                            ),
                            title: Text(
                              HomeCubit.get(context).isArabic
                                  ? "الأقسام"
                                  : "Categories",
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),

                          /// add ads
                          if (isSignIn == true)
                          ListTile(
                            onTap: () {
                              context.pushNamed(Routes.addAdsScreen);
                            },
                            leading: const Icon(
                              IconlyBold.paper_plus,
                            ),
                            title: Text(
                              HomeCubit.get(context).isArabic
                                  ? "أضف إعلانك "
                                  : "Add your Ad",
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),

                          /// pending services Admin
                          if (isSignIn == true && isAdmin == true)
                            ListTile(
                              onTap: () {
                                context.pushNamed(Routes.allServicesPendingScreen);
                              },
                              leading: const Icon(
                                IconlyBold.paper_plus,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? "الخدمات المعلقة "
                                    : "Pending services",
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),

                          /// pending ads Admin
                          if (isSignIn == true && isAdmin == true)
                            ListTile(
                              onTap: () {
                                context.pushNamed(Routes.allAdsPendingScreen);
                              },
                              leading: const Icon(
                                IconlyBold.paper_plus,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? "الإعلانات المعلقة "
                                    : "Pending Ads",
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),




                          /// approved ads for current User
                           if (isSignIn == true && isAdmin == false)
                            ListTile(
                              onTap: () {
                                context.pushNamed(Routes.allAdsApprovedScreenForUsers);
                              },
                              leading: const Icon(
                                IconlyBold.paper_plus,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? "الإعلانات المقبولة "
                                    : "Approved Ads",
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),

                          /// approved services for current User
                          if (isSignIn == true && isAdmin == false)
                            ListTile(
                              onTap: () {
                                context.pushNamed(Routes.allServicesApprovedScreenForUsers);
                              },
                              leading: const Icon(
                                IconlyBold.paper_plus,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? "الخدمات المقبولة "
                                    : "Approved Services",
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),

                          /// pending ads for current User
                          if (isSignIn == true && isAdmin == false)
                            ListTile(
                              onTap: () {
                                context.pushNamed(Routes.allAdsPendingScreenForUsers);
                              },
                              leading: const Icon(
                                IconlyBold.paper_plus,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? "الإعلانات قيد الانتظار "
                                    : "Pending Ads",
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),

                          ///Who are we
                          ListTile(
                            onTap: () {
                              context.pushNamed(Routes.whoAreWeScreen);
                            },
                            leading: const Icon(
                              IconlyBold.user_2,
                            ),
                            title: Text(
                              HomeCubit.get(context).isArabic
                                  ? "من نحن "
                                  : "Who are we ",
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),

                          //سياسة الاستخدام
                          ListTile(
                            onTap: () {
                              context.pushNamed(Routes.usagePolicyScreen);
                            },
                            leading: const Icon(
                              IconlyBold.chart,
                            ),
                            title: Text(
                              HomeCubit.get(context).isArabic
                                  ? "سياسة الاستخدام"
                                  : "Usage policy",
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),

                          //سياسة الخصوصية
                          ListTile(
                            onTap: () {
                              context.pushNamed(Routes.privacyPolicyScreen);
                            },
                            leading: const Icon(
                              IconlyBold.paper,
                            ),
                            title: Text(
                              HomeCubit.get(context).isArabic
                                  ? "سياسة الخصوصية"
                                  : "privacy policy",
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),

                          ///language
                          ListTile(
                            onTap: () {
                              HomeCubit.get(context).changeAppLanguage();
                            },
                            leading: const Icon(
                              Icons.translate_rounded,
                            ),
                            title: Row(
                              children: [
                                Text(
                                  HomeCubit.get(context).isArabic
                                      ? "اللغة : "
                                      : 'language : ',
                                  style: const TextStyle(
                                    fontWeight: FontWeightHelper.bold,
                                  ),
                                ),
                                Text(
                                    HomeCubit.get(context).isArabic
                                        ? 'English'
                                        : 'العربية',
                                    style: TextStyles.font18BlackBold)
                              ],
                            ),
                          ),

                          ///About us
                          ListTile(
                            onTap: () {
                              context.pushNamed(Routes.contactUsScreen);
                            },
                            leading: const Icon(
                              IconlyBold.message,
                            ),
                            title: Text(
                              HomeCubit.get(context).isArabic
                                  ? "تواصل معنا"
                                  : 'Contact Us',
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),

                          if (isSignIn == true)
                            ListTile(
                              onTap: () {
                                DialogUtils.showMessage(
                                    context,
                                    HomeCubit.get(context).isArabic
                                        ? 'هل أنت متأكد من تسجيل الخروج ؟'
                                        : 'Are you sure you want to logout ?',
                                    posActionTitle:
                                        HomeCubit.get(context).isArabic
                                            ? "نعم"
                                            : "yes", posAction: () async {
                                  var prefs =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    isSignIn = false;
                                  });
                                  prefs.setBool('isAuth', false);
                                  prefs.remove('userId');
                                  prefs.remove('token');
                                  context
                                      .pushReplacementNamed(Routes.homeScreen);
                                },
                                    negActionTitle:
                                        HomeCubit.get(context).isArabic
                                            ? "لا"
                                            : "no",
                                    negAction: () {});
                              },
                              leading: const Icon(
                                IconlyBold.logout,
                              ),
                              title: Text(
                                HomeCubit.get(context).isArabic
                                    ? 'تسجيل الخروج'
                                    : 'Logout',
                                style: const TextStyle(
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ),

                          verticalSpace(10),
                          Text(
                            HomeCubit.get(context).isArabic
                                ? "حقوق الطبع والنشر 2023 © تم إنشاؤه بيوع كل الحقوق محفوظة."
                                : "Copyright 2023 © Theme created by Boyo3.com All rights reserved.",
                            style: const TextStyle(
                                fontWeight: FontWeightHelper.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
