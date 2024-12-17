import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/forsale_vehicle_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/rent_vehicles_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/wanted_vehicles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class VehicleScreen extends StatefulWidget {
  final String type1;
  VehicleScreen({super.key, required this.type1});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen>
    with TickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(vsync: this, length:3);
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
      length: 3,
      child: BlocConsumer<VehicleCubit, VehicleState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            // floatingActionButton: FloatingActionButton.extended(  
            //   backgroundColor: Colors.white,
            //     onPressed: () {
            //       widget.type1 == ApiConstants.caravan
            //           ? context.pushNamed(Routes.addCaravanScreen)
            //           : widget.type1 == ApiConstants.cars
            //               ? context.pushNamed(Routes.addCarsScreen)
            //               : widget.type1 == ApiConstants.motorcycles
            //                   ? context.pushNamed(Routes.addMotorcycles)
            //                   : context.pushNamed(Routes.addTools);
            //     },
            //     label: Row(
            //       children: [
            //         Text(
            //           widget.type1 == ApiConstants.caravan
            //               ? 'Add Caravan'
            //               : widget.type1 == ApiConstants.cars
            //                   ? 'Add car'
            //                   : widget.type1 == ApiConstants.motorcycles
            //                       ? 'Add Motorcycle'
            //                       : 'Add Tools',
            //                       style: TextStyles.font15MainRed,
            //         ),
            //         horizontalSpace(5),
            //         Image.asset(
            //                 widget.type1 == ApiConstants.caravan
            //               ?"assets/images/png_icons/caravan.png"
            //               : widget.type1 == ApiConstants.cars
            //                   ?"assets/images/png_icons/4x4.png"
            //                   : widget.type1 == ApiConstants.motorcycles
            //               ?
            //               "assets/images/png_icons/motorcycle.png"
            //               :"assets/images/png_icons/tools.png",

            //               width: 35,
            //               height: 30,
            //               color: ColorsManager.mainRed,
            //         )
                    
            //       ],
            //     )),
            appBar: AppBar(
              
              title: const Boyo3AppBarLogo(),
              actions: [
            IconButton(
                onPressed: () {
                  context.pushNamed(Routes.searachVehicle);
                },
                icon: const Icon(
                  IconlyBroken.search,
                  color: Colors.black,
                ))
          ],
              bottom: TabBar(
                labelColor: ColorsManager.mainRed,
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicatorColor: ColorsManager.mainRed,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                // indicator: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10.0),
                //   border: Border.all(
                //     width: 1.0,
                //     color: ColorsManager.mainRed,
                //   )
                // ),
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  fontFamily: "Jannah",
                ),
                unselectedLabelStyle:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0.sp,
                  fontFamily: "Jannah",
                ),
                tabs: [
                  Tab(
                    text:
                        HomeCubit.get(context).isArabic ? "بيع" : "Sale",
                  ),
                   Tab(
                    text:
                        HomeCubit.get(context).isArabic ? "ايجار" : "Rent",
                  ),
                  Tab(
                    text:
                        HomeCubit.get(context).isArabic ? "مطلوب " : "Wanted",
                  ),
                  
                ],
              ),
            ),
            body: Column(
              children: [
                verticalSpace(10),
                Expanded(
                  child: TabBarView(children: [
                    ForSaleVehicleWidget(
                      type1: widget.type1,
                    ),
                    RentVehiclesWidget(type1: widget.type1),
                    WantedVehiclesWidget(type1: widget.type1),
                   
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
