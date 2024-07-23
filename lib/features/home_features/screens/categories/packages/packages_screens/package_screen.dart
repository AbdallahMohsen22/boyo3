import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/ads_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/ads_package_states.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_widgets/ads_packages_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_widgets/services_packages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/home_cubit/home_cubit.dart';

class AdsPackagesScreen extends StatefulWidget {
  const AdsPackagesScreen({super.key});

  @override
  State<AdsPackagesScreen> createState() => _AdsPackagesScreenState();
}

class _AdsPackagesScreenState extends State<AdsPackagesScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(vsync: this, length: 2);
    _tabcontroller.addListener(_handletabselection);
    super.initState();
  }

  void _handletabselection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<AdsPackagesCubit, AdsPackagesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Boyo3AppBarLogo(),
              //  leading: IconButton(
              //     onPressed: () {
              //       context.pushNamed(Routes.categoriesScreen);
              //     },
              //     icon: Icon(Icons.arrow_back)),

              bottom: TabBar(
                labelColor: Colors.red[900],
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.red[900],
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: "Jannah",
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: "Jannah",
                ),
                tabs: [
                  Tab(
                    text: HomeCubit.get(context).isArabic
                        ? "الباقات التجارية "
                        : "Commercial Packages",
                  ),
                  Tab(
                    text: HomeCubit.get(context).isArabic
                        ? "الباقات الاعلانية"
                        : "Advertising Packages",
                  ),
                ],
              ),
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                    const AdsPackageWidget(),

                  verticalSpace(10),
                  Container(
                            height: 2,
                            width: double.infinity,
                            color: ColorsManager.mainRed
                            ),

                  verticalSpace(3),

                  Container(
                          height: 2,
                            width: double.infinity,
                            color:ColorsManager.mainRed
                            ),
                  const ServicePackageWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
