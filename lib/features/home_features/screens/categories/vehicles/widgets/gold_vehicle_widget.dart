import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/sliver_grid_with_height.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_widgets.dart/gold_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class GoldAdsWidget extends StatefulWidget {
 
  GoldAdsWidget({super.key,});

  @override
  State<GoldAdsWidget> createState() => _GoldAdsWidgetState();
}

class _GoldAdsWidgetState extends State<GoldAdsWidget> {
  @override
  void initState() {
    getAllGoldAds(context);
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
      }, success: (getAllVehicleResponse) {
        return GridView.builder(
            itemCount: getAllVehicleResponse.length,
             gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount:3,
                             height: 150.h
                             ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
            itemBuilder: (context, index) {
              return GoldWidget(vehicle: getAllVehicleResponse[index]);
            });
      }, error: (error) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 150,
                ),
                Text(
                  'Something went wrong , please try again later ',
                  style: TextStyles.font15BlackBold,
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  void getAllGoldAds(BuildContext context) {
    context.read<VehicleCubit>().emitGetAllGoldAds();
  }
}
