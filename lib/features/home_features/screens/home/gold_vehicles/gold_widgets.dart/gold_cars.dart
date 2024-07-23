import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_widgets.dart/gold_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../../../core/theming/colors.dart';

class GetGoldCars extends StatefulWidget {
  const GetGoldCars({super.key});

  @override
  State<GetGoldCars> createState() => _GetGoldCarsState();
}

class _GetGoldCarsState extends State<GetGoldCars> {
  @override
  void initState() {
    getGoldCars(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleCubit, VehicleState>(
        builder: (context, VehicleState state) {
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
      }, success: (getGoldCarsResponse) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
             itemCount: getGoldCarsResponse.length,
              itemBuilder: (BuildContext context, int index) {
                return GoldWidget(vehicle: getGoldCarsResponse[index]);
              })
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
                  size: 50,
                ),
                Text(
                  'Something went wrong ,check your internet \n try again later ',
                  style: TextStyles.font13BlackBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  void getGoldCars(BuildContext context) {
    context.read<VehicleCubit>().emitGetGoldCars();
  }
}
