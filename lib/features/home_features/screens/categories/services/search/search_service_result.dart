import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_state.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/search/search_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchServiceResult extends StatefulWidget {
    final String searchKey;

  SearchServiceResult({
    super.key,
    required this.searchKey
  });

  @override
  State<SearchServiceResult> createState() => _SearchServiceResultState();
}

class _SearchServiceResultState extends State<SearchServiceResult> {
  @override
  void initState() {
    getSearchVehicles(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Boyo3AppBarLogo(),
      ),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(10),
            BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, ServiceState state) {
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
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5.h,
                      );
                    },
                    itemCount: getSearchVehiclesResponse.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ServiceWidgetForSearch(
                        serviceModel: getSearchVehiclesResponse[index],
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
    context.read<ServiceCubit>().emitSearchService(
      serviceName: widget.searchKey
    );
  }
}
