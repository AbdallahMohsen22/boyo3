import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/vehicle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchVehiclesResult extends StatefulWidget {
    final String searchKey;

  SearchVehiclesResult({
    super.key,
    required this.searchKey
  });

  @override
  State<SearchVehiclesResult> createState() => _SearchVehiclesResultState();
}

class _SearchVehiclesResultState extends State<SearchVehiclesResult> {
  @override
  void initState() {
    getSearchVehicles(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Boyo3AppBarLogo(),
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(10),
            BlocBuilder<VehicleCubit, VehicleState>(
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
              }, success: (getSearchVehiclesResponse) {
                return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5.h,
                      );
                    },
                    itemCount: getSearchVehiclesResponse.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VehiclesWidget(
                        vehicleModel: getSearchVehiclesResponse[index],
                      );
                    });
              }, error: (error) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_rounded,
                          size: 200,
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
            })
          ],
        ),
      ),
    );
  }

  void getSearchVehicles(BuildContext context) {
    context.read<VehicleCubit>().searchForVehiclesOrTools(
      vehicleOrToolName: widget.searchKey
    );
  }
}
