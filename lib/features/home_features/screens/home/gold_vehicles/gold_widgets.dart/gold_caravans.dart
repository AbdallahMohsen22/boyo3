import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_widgets.dart/gold_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../../../core/theming/colors.dart';

class GetGoldCaravans extends StatefulWidget {
  const GetGoldCaravans({super.key});

  @override
  State<GetGoldCaravans> createState() => _GetGoldCaravansState();
}

class _GetGoldCaravansState extends State<GetGoldCaravans> {
  @override
  void initState() {
    getGoldCaravan(context);
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
      }, success: (getGoldCaravanResponse) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child:ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
             itemCount: getGoldCaravanResponse.length,
              itemBuilder: (BuildContext context, int index) {
                return GoldWidget(vehicle: getGoldCaravanResponse[index]);
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

  void getGoldCaravan(BuildContext context) {
    context.read<VehicleCubit>().emitGetGoldCaravan();
  }
}
