import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/maintenance_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/rent_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/transfer.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/washing.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/waste_dispol_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/water_filling_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;
  @override
  void initState() {
    super.initState();

    _tabcontroller = TabController(vsync: this, length:6);
    _tabcontroller.addListener(_handletabselection);
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
      length: 6,
      child: Scaffold(
        // floatingActionButton: FloatingActionButton.extended(
        //   backgroundColor: Colors.white,
        //   onPressed: () {
        //     context.pushNamed(Routes.addService);
        //   },
        //   label: Row(
        //     children: [
        //       Text(
        //         HomeCubit.get(context).isArabic ? "اضافة خدمة" : "Add Service",
        //         style: TextStyles.font15MainRed,
        //       ),
        //       horizontalSpace(5),
        //       Image.asset(
        //         'assets/images/png_icons/service.png',
        //         width: 35,
        //         height: 30,
        //         color: ColorsManager.mainRed,
        //       )
        //     ],
        //   ),
        // ),

        appBar: AppBar(
          title: Boyo3AppBarLogo(),
          actions: [
            IconButton(
                onPressed: () {
                  context.pushNamed(Routes.searachServices);
                },
                icon: const Icon(
                  IconlyBroken.search,
                  color: Colors.black,
                ))
          ],
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            labelColor: ColorsManager.mainRed,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicatorColor: ColorsManager.mainRed,
            unselectedLabelColor: Colors.black,
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(5),
            //   color: Colors.blac

            // ),
            tabAlignment: TabAlignment.start,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: "Jannah",
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              fontFamily: "Jannah",
            ),
            tabs: [
              
              Tab(
                text:
                    HomeCubit.get(context).isArabic ? "صيانة " : "Maintenance ",
              ),
              Tab(
                text: HomeCubit.get(context).isArabic ? "إيجار " : "Rent ",
              ),
              Tab(
                text: HomeCubit.get(context).isArabic ? "نقل" : "Transfer",
              ),
              Tab(
                text: HomeCubit.get(context).isArabic ? "غسيل" : "Washing",
              ),
              Tab(
                text: HomeCubit.get(context).isArabic
                    ? "تصريف مخلفات "
                    : "Waste Disposal",
              ),
              Tab(
                text: HomeCubit.get(context).isArabic
                    ? "تعبئة مياه"
                    : "Water Filling ",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MaintenanceWidget(),
            RentWidget(),
            TransferWidget(),
            WashingWidget(),
            WasteDispolWidget(),
            WaterFillingWidget(),
          ],
        ),
      ),
    );
  }
}
