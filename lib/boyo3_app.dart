import 'package:boyo3_v1/core/routing/app_router.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/app_theme.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home_features/screens/categories/vehicles/block_user_cuibt.dart';
import 'features/profile/cuibt/user_cuibt.dart';
import 'features/profile/delete_cuibt/delete_user_cuibt.dart';


class Boyo3App extends StatelessWidget {
  final AppRouter appRouter;
  final bool? isEnglish;
  const Boyo3App({
    super.key,
    required this.appRouter,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size.width >= 768
        ? const Size(768, 1024)  // iPad size
        : const Size(360, 690),  // Phone size
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (BuildContext context) =>
            HomeCubit()..changeAppLanguage(fromShared: isEnglish),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<UserCubit>(create: (context) => UserCubit()),
                BlocProvider<DeleteUserCubit>(create: (context) => DeleteUserCubit()),
                BlocProvider(create: (context) => BlockUserCubit()),

              ],
              child: MaterialApp(
                builder: DevicePreview.appBuilder,
                title: "Boyo3 App",
                theme: appTheme(),
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const <Locale>[
                  Locale('en'), // English
                  Locale('ar'), // Spanish
                ],
                locale: HomeCubit.get(context).isArabic
                    ? const Locale('ar')
                    : const Locale('en'), //Locale(settingsProvider.currentLang),

                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splashScreen,
                onGenerateRoute: appRouter.generateRoute,
              ),
            );
          },
        ),
      ),
    );
  }
}
