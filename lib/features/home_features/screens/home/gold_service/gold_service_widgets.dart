import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/sliver_grid_with_height.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/network/api_constants.dart';

class GoldServiceWidgetForHome extends StatefulWidget {
  const GoldServiceWidgetForHome({super.key});

  @override
  State<GoldServiceWidgetForHome> createState() => _GoldServiceWidgetForHomeState();
}

class _GoldServiceWidgetForHomeState extends State<GoldServiceWidgetForHome> {

  @override
  void initState() {
    getAllGoldService(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
                HomeCubit.get(context).isArabic
                    ? "خدمات مميزه"
                    : 'Special Service',
                style: TextStyles.font18BlackBold),
            const Spacer(),
            TextButton(
                onPressed: () {
                  context.pushNamed(Routes.serviceScreen);
                },
                child: Text(HomeCubit.get(context).isArabic ? 'المزيد' : "More",
                    style: TextStyles.font15MainRed)),
          ],
        ),
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
      }, success: (getAllServiceResponse) {
         return LayoutBuilder(
           builder: (context, constraints) {
             var orientation = MediaQuery.of(context).orientation;
             double imageWidth = constraints.maxWidth;
             double imageHeight = constraints.maxHeight;

             if (orientation == Orientation.portrait) {
               imageWidth = constraints.maxWidth * 0.6;
               imageHeight = imageWidth * 0.6; // Maintain aspect ratio
             } else {
               imageWidth = constraints.maxWidth;
               imageHeight = constraints.maxHeight;
             }

             return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical:10.0.w ),
                    child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount:3, height: 125.h,mainAxisSpacing: 15,crossAxisSpacing: 7),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getAllServiceResponse.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                            child: InkWell(
                              onTap: () {
                                context.pushNamed(Routes.serviceDetails,
                                    arguments: getAllServiceResponse[index]);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1.5, color: Colors.black)),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${ApiConstants.apiBaseUrlForImage}${getAllServiceResponse[index].image1}",

                                            //"http://andrewfayez-001-site1.ltempurl.com/${getAllProductResponse[index].image1}",
                                        fit: BoxFit.fill,
                                        httpHeaders: const {
                                          ApiConstants.tokenTitle:
                                              ApiConstants.tokenBody
                                        },
                                        width: imageWidth,
                                        height: imageHeight,
                                        placeholder: (context, url) => Center(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SpinKitFadingCircle(
                                                    size: 20,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return DecoratedBox(
                                                        decoration: BoxDecoration(
                                                            color: index.isEven
                                                                ? ColorsManager
                                                                    .mainRed
                                                                : ColorsManager
                                                                    .mainRed),
                                                      );
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  verticalSpace(1),

                                  Text(
                                    HomeCubit.get(context).isArabic?
                                    getAllServiceResponse[index].title:getAllServiceResponse[index].title,
                                    maxLines: 1,
                                    style: TextStyles.font12BlackBold,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
           }
         );
           
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
    );
  }
    void getAllGoldService(BuildContext context) {
    context.read<ServiceCubit>().emitGetAllGoldService();
  }
}