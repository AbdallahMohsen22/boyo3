import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_states.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/price_filter/widget/filter_price_widget.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/widgets/vehicle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';


class FilterPriceVehiclesScreen extends StatefulWidget {
  const FilterPriceVehiclesScreen({super.key});

  @override
  State<FilterPriceVehiclesScreen> createState() => _FilterPriceVehiclesScreenState();
}

class _FilterPriceVehiclesScreenState extends State<FilterPriceVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Boyo3AppBarLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const FilterPriceFields(),
              verticalSpace(20),
              AppTextButton(
                      buttonText: HomeCubit.get(context).isArabic
                          ? "بحث"
                          : "Search",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        getVehiclesByPrice(context); 
                      },
                    ),
               BlocBuilder<VehicleCubit, VehicleState>(
              builder: (context, VehicleState state) {
            return state.when(initial: () {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      verticalSpace(40),
                        const Icon(
                          IconlyBold.filter_2,
                          size: 150,
                        ),
                        verticalSpace(10),
                        Text(
                          'Enter Price To Filter',
                          style: TextStyles.font18BlackBold,
                        )
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
              if(getAllVehicleResponse.length != 0 ){
                  return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: getAllVehicleResponse.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return VehiclesWidget(
                        vehicleModel: getAllVehicleResponse[index]);
                  });
              
                  }
                else {
                  return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        IconlyBold.paper,
                        size: 150,
                      ),
                      verticalSpace(10),
                      Text(
                        'NO Data Added Here',
                        style: TextStyles.font15BlackBold,
                      ),
                    ],
                  ),
                ),
              );
           
                }
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
                      verticalSpace(10),
                      Text(
                        'Something went wrong , please try again later ',
                        style: TextStyles.font15BlackBold,
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
        
               ],
          ),
        ),
      ),
    );
  }

  void getVehiclesByPrice(BuildContext context) {
    context.read<VehicleCubit>().getVehiclesByPrice();
  }
}


