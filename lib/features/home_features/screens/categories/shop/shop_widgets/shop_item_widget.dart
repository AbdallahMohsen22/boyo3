import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/data/models/shop/shop_items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/network/api_constants.dart';
import '../../../../../../core/theming/styles.dart';

class ShopItemWidget extends StatelessWidget {
  final ShopItemModel shopItemModel;
  ShopItemWidget({super.key, required this.shopItemModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 1.0.h),
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.shopDetails ,arguments: shopItemModel);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorsManager.mainRed, width: 1.5.w)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(HomeCubit.get(context).isArabic ? 0 : 20),
                  topRight:
                      Radius.circular(HomeCubit.get(context).isArabic ? 20 : 0),
                  bottomLeft:
                      Radius.circular(HomeCubit.get(context).isArabic ? 0 : 20),
                  bottomRight:
                      Radius.circular(HomeCubit.get(context).isArabic ? 20 : 0),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                   "${ApiConstants.apiBaseUrlForImage}${shopItemModel.image1}",

                  fit: BoxFit.fill,
                  httpHeaders: const {
                    ApiConstants.tokenTitle: ApiConstants.tokenBody
                  },
                  width: 110.w,
                  height: 85.h,
                  placeholder: (context, url) => Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SpinKitFadingCircle(
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
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              horizontalSpace(4),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      HomeCubit.get(context).isArabic
                          ? shopItemModel.productNameArabic
                          : shopItemModel.productNameEnglish,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font15BlackBold,
                    ),
                    Text(
                      HomeCubit.get(context).isArabic
                          ? "يوجد لدينا عدد : ${shopItemModel.quantity} من هذا المنتج "
                          : "We have : ${shopItemModel.quantity} of this product",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font14GrayRegular,
                    ),
                    Row(
                      children: [
                        Text(
                          "${shopItemModel.price.toString()} AED",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font15MainRed,
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: ColorsManager.mainRed,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? "شراء"
                                        : "Buy",
                                    style: TextStyles.font15WhiteBold,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
