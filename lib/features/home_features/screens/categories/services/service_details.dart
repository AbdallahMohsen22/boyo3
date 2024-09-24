import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/service_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/app_text_booton.dart';
import '../../../../../core/widgets/share_dialog.dart';

class ServiceDetails extends StatelessWidget {
  final ServiceModel serviceModel;

  ServiceDetails({required this.serviceModel});

  void _launcherUrl(int value) async {
    String url = "";
    if (value == 1) {
      url = "https://wa.me/${serviceModel.phoneNumber}";
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
          // actions:[
          //   InkWell(
          //     onTap: () {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return ShareDialog(content: 'Hey Please visit my profile!');
          //         },
          //       );
          //     },
          //
          //     child: const Icon(
          //       Icons.share_rounded,
          //       color: Colors.black,
          //     ),
          //   ),
          // ]
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),

                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConstants.apiBaseUrlForImage}${serviceModel.image3}",
                          fit: BoxFit.fill,
                          height: 300.h,
                          width: double.infinity,
                          placeholder: (context, url) => Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SpinKitFadingCircle(
                                      size: 20,
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),

                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConstants.apiBaseUrlForImage}${serviceModel.image2}",
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),

                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConstants.apiBaseUrlForImage}${serviceModel.image1}",
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                      /// sale and type

                      ///name
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              HomeCubit.get(context).isArabic
                                  ? serviceModel.title
                                  : serviceModel.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font18MainRed)),

                      ///condition
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                    HomeCubit.get(context).isArabic
                                        ? " النوع :"
                                        : "Type :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold),
                                horizontalSpace(15),
                                Text(serviceModel.type2,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),

                      ///price
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              HomeCubit.get(context).isArabic
                                  ? " الهاتف :"
                                  : "Phone :",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font15BlackBold,
                            ),
                            horizontalSpace(10),
                            Text(
                              serviceModel.phoneNumber,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font14GreyBold,
                            ),
                            Spacer(),
                            Text(
                                HomeCubit.get(context).isArabic
                                    ? "السعر : "
                                    : "Price : ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font15BlackBold),
                            horizontalSpace(10),
                            Text(
                              "${serviceModel.price} AED",
                              style: TextStyles.font15MainRed,
                            ),
                          ],
                        ),
                      ),

                      verticalSpace(10),

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
                          serviceModel.description,
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
                              ? "منصة بيوع غير مسؤولة عن عمليات البيع والشراء والتبادل التجاري، وتنصح بأخذ الحيطة والحذر وتوثيق عمليات البيع و الشراء و التدابير الوقائية حسب المتبع في كل دولة"
                              : "The platform does not allow any sale transaction made using its services, and it is advised to take caution and document purchases. Preventive measures are in place.Every country",
                          style: TextStyles.font15MainRed,
                        ),
                      ),

                      ///whatsapp
                      Row(
                        children: [
                          Expanded(
                            child: AppTextButton(
                              buttonText: HomeCubit.get(context).isArabic
                                  ? 'واتساب'
                                  : 'WhatsApp',
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () async {
                                _launcherUrl(1);
                              },
                            ),
                          ),
                          horizontalSpace(3),
                          Expanded(
                            child: AppTextButton(
                              buttonText: HomeCubit.get(context).isArabic
                                  ? 'اتصال'
                                  : 'Call',
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () async {
                                _launcherUrl(2);
                              },
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      AppTextButton(
                        buttonText: HomeCubit.get(context).isArabic
                            ? 'الذهاب الي الموقع '
                            : 'Go to location',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () async {
                          goToLocationOnMap();
                        },
                      ),
                      verticalSpace(20),


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

  Future<void> goToLocationOnMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${serviceModel.latitude},${serviceModel.longitude}';
    final Uri uri = Uri.parse(googleUrl);
    print(serviceModel.longitude);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "can\,t launch url";
    }
  }
}
