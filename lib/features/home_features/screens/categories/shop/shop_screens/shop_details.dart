import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/data/models/shop/shop_items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/network/api_constants.dart';
import '../../../../cubit/home_cubit/home_cubit.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ShopDetails extends StatelessWidget {
  final ShopItemModel shopItemModel;

  ShopDetails({super.key, required this.shopItemModel});

  void _launcherUrl(int value) async {
    String url = "";
    if (value == 1) {
      //url = "https://wa.me/${shopItemModel.phoneNumber}";
    } else if (value == 2) {
      url = "mailto:elsaleh103@gmail.com";
    }
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "can\,t launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Boyo3AppBarLogo(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 170.0.h,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    showIndicator: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeIn,
                    slideIndicator: const CircularSlideIndicator(
                      // currentIndicatorColor: ColorsManager.mainRed,
                      // padding: EdgeInsets.all(5),
                    ),
                    
                  ),
                  items: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      
                        child: CachedNetworkImage(
                          imageUrl:
                            "${ApiConstants.apiBaseUrlForImage}${shopItemModel.image1}",

                          fit: BoxFit.fill,
                          height: 300.h,
                          width: double.infinity,
                          placeholder: (context, url) =>  Center(
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
                          httpHeaders: const {
                            ApiConstants.tokenTitle: ApiConstants.tokenBody
                          },
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      
                        //Image.network(widget.product.imageUrl)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      
                        child: CachedNetworkImage(
                          imageUrl:
                               "${ApiConstants.apiBaseUrlForImage}${shopItemModel.image2}",
                          fit: BoxFit.fill,
                          width: double.infinity,
                          httpHeaders: const {
                            ApiConstants.tokenTitle: ApiConstants.tokenBody
                          },
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
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      
                        //Image.network(widget.product.imageUrl)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      
                        child: CachedNetworkImage(
                          imageUrl:
                               "${ApiConstants.apiBaseUrlForImage}${shopItemModel.image3}",
                          fit: BoxFit.fill,
                          httpHeaders: const {
                            ApiConstants.tokenTitle: ApiConstants.tokenBody
                          },
                          height: 300.h,
                          width: double.infinity,
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
                           errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      
                        //Image.network(widget.product.imageUrl)
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///name
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              HomeCubit.get(context).isArabic
                                  ? shopItemModel.productNameArabic
                                  : shopItemModel.productNameEnglish,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font18MainRed)),



                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                             Text(
                                  HomeCubit.get(context).isArabic
                                      ? "السعر : "
                                      : "Price : ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold),
                              horizontalSpace(10),
                              Text(
                                "${shopItemModel.price} AED",
                                style: TextStyles.font15MainRed,
                              ),
                              Spacer(),
                              Text(
                                  HomeCubit.get(context).isArabic
                                      ? "الكميه: "
                                      : "Quantity: ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold),
                              horizontalSpace(10),
                              Text(
                                HomeCubit.get(context).isArabic?"${shopItemModel.quantity} منتجات":
                                "${shopItemModel.quantity} product",
                                style: TextStyles.font15MainRed,
                              ),
                           
                        ],),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          shopItemModel.content,
                          style: TextStyles.font14LightGrayRegular
                        ),
                      ),



                      ///description

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          HomeCubit.get(context).isArabic
                              ? "الوصف :"
                              : "Description :",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          shopItemModel.describtion,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]!,
                              fontSize: 15.0.sp),
                        ),
                      ),

                      ///تحذير
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: Text(
                          HomeCubit.get(context).isArabic
                              ? "المنصة غير مسموح بها بشأن أي صفقة بيع يتم باستخدام خدماتها، وينصح بأخذ الحيطة والحذر وتوثيق عمليات الشراء التدابير الوقائية في كل دولة"
                              : "The platform does not allow any sale transaction made using its services, and it is advised to take caution and document purchases. Preventive measures are in place.Every country",
                          style: TextStyles.font15MainRed,
                        ),
                      ),

                      ///Buy
                      AppTextButton(
                        buttonText: HomeCubit.get(context).isArabic
                            ? 'شراء'
                            : 'Buy',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () async {

                        },
                      ),

                      verticalSpace(20)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
