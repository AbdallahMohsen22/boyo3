import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/network/api_constants.dart';
import '../../../../cubit/home_cubit/home_cubit.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class VehicleDetails extends StatelessWidget {
  final VehicleModel vehicleModel;

  VehicleDetails({super.key, required this.vehicleModel});

  void _launcherUrl(int value) async {
    String url = "";
    if (value == 1) {
      url = "https://wa.me/${vehicleModel.whatsAppNumber}";
    } else if (value == 2) {
      url = "tel://${vehicleModel.phoneNumber}";
    }
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "can\'t launch url";
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
        child: LayoutBuilder(
          builder: (context, constraints){
            double screenWidth = MediaQuery.of(context).size.width;
            double imageWidth = screenWidth * 0.6;
            double imageHeight = imageWidth * 0.6;// Maintain aspect ratio
            return Column(
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
                          currentIndicatorColor: ColorsManager.mainRed,
                          padding: EdgeInsets.all(5),
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
                              "${ApiConstants.apiBaseUrlForImage}${vehicleModel.image1}",
                              fit: BoxFit.fill,
                              width: imageWidth,
                              height: imageHeight,
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
                              "${ApiConstants.apiBaseUrlForImage}${vehicleModel.image2}",
                              fit: BoxFit.fill,
                              width: imageWidth,
                              height: imageHeight,
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
                              "${ApiConstants.apiBaseUrlForImage}${vehicleModel.image3}",
                              fit: BoxFit.fill,
                              httpHeaders: const {
                                ApiConstants.tokenTitle: ApiConstants.tokenBody
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
                                      ? vehicleModel.title
                                      : vehicleModel.title,
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
                                    Text(vehicleModel.type2,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font14GreyBold),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                        HomeCubit.get(context).isArabic
                                            ? "الحالة :"
                                            : "Condition :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font15BlackBold),
                                    horizontalSpace(10),
                                    Text(vehicleModel.type3,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font14GreyBold),
                                  ],
                                ),
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
                                      ? " سنة الصنع :"
                                      : " manufacturing year :",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold,
                                ),
                                horizontalSpace(10),
                                Text(
                                  vehicleModel.yearMake,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font14GreyBold,
                                ),
                                const Spacer(),
                                Text(
                                    HomeCubit.get(context).isArabic
                                        ? "السعر : "
                                        : "Price : ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold),
                                horizontalSpace(10),
                                Text(
                                  "${vehicleModel.price} AED",
                                  style: TextStyles.font14GreyBold,
                                  // style:  TextStyle(
                                  //     fontWeight: FontWeight.w400,
                                  //     fontSize: 15.0,
                                  //     color: Colors.red[900]
                                  // ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                if(vehicleModel.kilometer != 0)
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? " الكيلومتر :"
                                        : " Kilometer :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                if(vehicleModel.kilometer != 0)
                                  horizontalSpace(10),
                                if(vehicleModel.kilometer != 0)
                                  Text(
                                    vehicleModel.kilometer.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),


                                const Spacer(),
                                Text(
                                    HomeCubit.get(context).isArabic
                                        ? "الضمان : "
                                        : "Warranty : ",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold),
                                horizontalSpace(10),
                                Text(
                                  vehicleModel.warranty,
                                  style: TextStyles.font14GreyBold,
                                ),

                              ],
                            ),
                          ),

                          verticalSpace(5),
                          defaultLine(),

                          /// number of cylinders
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: vehicleModel.type1 !="tools" ?Row(
                              children: [
                                Text(
                                  HomeCubit.get(context).isArabic
                                      ? " عدد الاسطوانات :"
                                      : "Number Cylinders :",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold,
                                ),
                                horizontalSpace(10),
                                Text(
                                  vehicleModel.cylinders.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font14GreyBold,
                                ),
                                const Spacer(),
                              ],
                            ) : Container(),
                          ),

                          if (vehicleModel.height != 0)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? " طول الكرفان :"
                                        : " Caravan height :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.height.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          /// generator type
                          if (vehicleModel.generatorType != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? " نوع المولد :"
                                        : " Generator Type :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.generatorType,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          if (vehicleModel.size != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? "الحجم : "
                                        : "Size :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.size,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          defaultLine(),


                          if (vehicleModel.normalOrSaylant != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? "عادي او سايلنت : "
                                        : "Normal Or Saylant :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.normalOrSaylant,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          if (vehicleModel.numberOfParson != 0)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? "كم شخص يسع  : "
                                        : "How many people can it hold :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.numberOfParson.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),



                          /// number of cylinders

                          if (vehicleModel.airConditionCount != ApiConstants.noData)
                            defaultLine(),

                          ///air condition
                          if (vehicleModel.airConditionCount != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? " عدد تكييف الهواء:"
                                        : "Air Condition Count :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.airConditionCount.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          if (vehicleModel.airConditionSize != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? " حجم تكييف الهواء:"
                                        : "Air Condition Size :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.airConditionSize.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          if (vehicleModel.airConditionType != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  Text(
                                    HomeCubit.get(context).isArabic
                                        ? " نوع تكييف الهواء:"
                                        : "Air Condition Type :",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font15BlackBold,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    vehicleModel.airConditionType,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold,
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),

                          defaultLine(),

                          /// colors

                          if (vehicleModel.colorOut != ApiConstants.noData &&
                              vehicleModel.colorIn != ApiConstants.noData)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Row(
                                children: [
                                  if (vehicleModel.colorOut != ApiConstants.noData)
                                    Text(
                                      HomeCubit.get(context).isArabic
                                          ? " اللون الخارجي :"
                                          : " Color Out :",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font15BlackBold,
                                    ),
                                  if (vehicleModel.colorOut != ApiConstants.noData)
                                    horizontalSpace(10),
                                  if (vehicleModel.colorOut != ApiConstants.noData)
                                    Expanded(
                                      child: Text(
                                        vehicleModel.colorOut,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font14GreyBold,
                                      ),
                                    ),
                                  if (vehicleModel.colorIn != ApiConstants.noData)
                                  // const Spacer(),
                                    horizontalSpace(10),

                                  if (vehicleModel.colorIn != ApiConstants.noData)
                                    Text(
                                      HomeCubit.get(context).isArabic
                                          ? " اللون الداخلي :"
                                          : " Color in :",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font15BlackBold,
                                    ),
                                  if (vehicleModel.colorIn != ApiConstants.noData)
                                    horizontalSpace(10),
                                  if (vehicleModel.colorIn != ApiConstants.noData)
                                    Expanded(
                                      child: Text(
                                        vehicleModel.colorIn,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyles.font14GreyBold,
                                      ),
                                    ),
                                ],
                              ),
                            ),

                          verticalSpace(10),
                          defaultLine(),

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
                              vehicleModel.description,
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

                          verticalSpace(10),
                          AppTextButton(
                            buttonText: HomeCubit.get(context).isArabic
                                ? 'الذهاب الي موقع المعاينة'
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
            );
          },

        ),
      ),
    );
  }

  Future<void> goToLocationOnMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${vehicleModel.latitude},${vehicleModel.longitude}';
    final Uri uri = Uri.parse(googleUrl);
    print(vehicleModel.longitude);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "can\,t launch url";
    }
  }
}
