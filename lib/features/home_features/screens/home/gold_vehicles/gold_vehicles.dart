import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_widgets.dart/gold_caravans.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_widgets.dart/gold_cars.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_widgets.dart/gold_motorcycles.dart';
import 'package:boyo3_v1/features/home_features/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldVehicles extends StatefulWidget {
  const GoldVehicles({super.key,  this.icons});
  final CategoryItem? icons;

  @override
  State<GoldVehicles> createState() => _GoldVehiclesState();
}

class _GoldVehiclesState extends State<GoldVehicles>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Padding(
          padding:EdgeInsets.only(top :10.h, bottom: 10.h),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 1.0
              )
            ),
            child: Column(
              children: [
                
                 Padding(
                   padding: EdgeInsets.only(top :8.0.h, left:20.w,right: 20.w ),
                   child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text(
                    HomeCubit.get(context).isArabic
                        ? "عروض مميزة"
                        : 'Special Offers',
                    textAlign: TextAlign.start,
                    style: TextStyles.font18BlackBold
                                   ),
                                   
                                  
                                 ],
                               ),
                 ),
            
                TabBar(
                  // controller: goldVehiclesTabController,
                  tabAlignment: TabAlignment.center,
                  labelColor: Colors.red[900],
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.red[900],
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    fontFamily: "Jannah",
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0.sp,
                    fontFamily: "Jannah",
                  ),
                  tabs: [
                    Row(

                      children: [
                        Image.asset(
                          HomeCubit.get(context).categoriesIcon[0],
                          color: Colors.red[900],
                          width: 15.0.w,
                          height: 15.0.h,
                        ),
                        SizedBox(width: 5,),
                        Tab(
                          text:
                              HomeCubit.get(context).isArabic ? "كرفانات " : "Caravan",
                          // icon: Image.asset(
                          //   HomeCubit.get(context).categoriesIcon[0],
                          //   color: Colors.red[900],
                          //   width: 20.0.w,
                          //   height: 20.0.h,
                          // ),

                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Image.asset(
                          HomeCubit.get(context).categoriesIcon[1],
                          color: Colors.red[900],
                          width: 15.0.w,
                          height: 15.0.h,
                        ),
                        SizedBox(width: 5,),
                        Tab(
                          text: HomeCubit.get(context).isArabic
                              ? "سيارات 4x4 "
                              : "Cars 4x4",
                        ),
                      ],
                    ),


                    Row(
                      children: [
                        Image.asset(
                          HomeCubit.get(context).categoriesIcon[2],
                          color: Colors.red[900],
                          width: 15.0.w,
                          height: 15.0.h,
                        ),
                        SizedBox(width: 5,),
                        Tab(
                          text: HomeCubit.get(context).isArabic
                              ? "دراجة نارية "
                              : "Motorcycle",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 142.0.h,
                  child: const TabBarView(
                      // controller: goldVehiclesTabController,
                      children: [
                        GetGoldCaravans(),
                        GetGoldCars(),
                        GetGoldMotorcycles(),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
