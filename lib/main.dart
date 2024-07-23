import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/boyo3_app.dart';
import 'package:boyo3_v1/core/routing/app_router.dart';
import 'package:boyo3_v1/injection.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  initGetIt();
  final prefs = await SharedPreferences.getInstance();

  bool? isEnglish = prefs.getBool('isEnglish');
  isSignIn = prefs.getBool('isAuth');
  adId = prefs.getInt('adId');
  isAdmin = prefs.getBool('isAdmin');
  userId = prefs.getString("userId");
  adsPackageId = prefs.getInt(
    'adsPackageId',
  );
  servicePackageId = prefs.getInt(
    'servicePackageId',
  );
  if (kDebugMode) {
    print("isAuth =");
    print(isSignIn);
    print("isAdmin =");
    print(isAdmin);
    print("userId =");
    print(userId);
    print("adsPackageId =");
    print(adsPackageId);
    print("servicePackageId =");
    print(servicePackageId);
    print("adId =");
    print(adId);

  }
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => Boyo3App(
  //       isEnglish: isEnglish,
  //       appRouter: AppRouter(),
  //     ), // Wrap your app
  //   ),
  // );
  runApp(
    Boyo3App(
      isEnglish: isEnglish,
      appRouter: AppRouter(),
    ),
  );
}
