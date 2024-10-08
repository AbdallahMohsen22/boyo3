import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/widgets/sliver_grid_with_height.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../core/theming/styles.dart';
import '../../../cubit/home_cubit/home_cubit.dart';

class GetProductsForHome extends StatefulWidget {
  const GetProductsForHome({super.key});

  @override
  State<GetProductsForHome> createState() => _GetProductsForHomeState();
}

class _GetProductsForHomeState extends State<GetProductsForHome> {
  @override
  void initState() {
    getAllProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(5),
        // Row(
        //   children: [
        //     Text(
        //         HomeCubit.get(context).isArabic
        //             ? "منتجات مميزه"
        //             : 'Special Products',
        //         style: TextStyles.font18BlackBold),
        //     Spacer(),
        //     TextButton(
        //         onPressed: () {
        //           context.pushNamed(Routes.shopScreen);
        //         },
        //         child: Text(HomeCubit.get(context).isArabic ? 'المزيد' : "More",
        //             style: TextStyles.font15MainRed))
        //   ],
        // ),
        SizedBox(
         
          child: BlocBuilder<ShopCubit, ShopState>(
              builder: (context, ShopState state) {
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
            }, success: (getAllProductResponse) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                child: GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount:3, height: 125.h),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:  getAllProductResponse.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                        child: InkWell(
                          onTap: () {
                            context.pushNamed(Routes.shopDetails,
                                arguments: getAllProductResponse[index]);
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
                                        "${ApiConstants.apiBaseUrlForImage}${getAllProductResponse[index].image1}",

                                        //"http://andrewfayez-001-site1.ltempurl.com/${getAllProductResponse[index].image1}",
                                    fit: BoxFit.fill,
                                    httpHeaders: const {
                                      ApiConstants.tokenTitle:
                                          ApiConstants.tokenBody
                                    },
                                    width: 100.w,
                                    height: 100.h,
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
                              verticalSpace(5),
                              Text(
                                HomeCubit.get(context).isArabic?
                                getAllProductResponse[index].productNameArabic:getAllProductResponse[index].productNameEnglish,
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
          }),
        )
      ],
    );
  }

  void getAllProducts(BuildContext context) {
    context.read<ShopCubit>().emitGetAllAdsProductsStates();
  }
}
