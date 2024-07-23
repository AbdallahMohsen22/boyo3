import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_state.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/widgets/service_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GetExhibitionWidget extends StatefulWidget {
  GetExhibitionWidget({super.key});

  @override
  State<GetExhibitionWidget> createState() => _GetExhibitionWidgetState();
}

class _GetExhibitionWidgetState extends State<GetExhibitionWidget> {
  @override
  void initState() {
    getExhibition(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCubit, ServiceState>(
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
      }, success: (getAllServiceResponse) {
        return ListView.builder(
            itemCount: getAllServiceResponse.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ServiceWidget(serviceModel: getAllServiceResponse[index]);
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
    });
  }

  void getExhibition(BuildContext context) {
    context.read<ServiceCubit>().emitGetWorkShopAndExhibition(
          type: ApiConstants.exhibition,
        );
  }
}
