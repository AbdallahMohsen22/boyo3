import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_booton.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/network/api_constants.dart';
import '../../../../../../core/theming/font_weight_helper.dart';
import '../../../../cubit/home_cubit/home_cubit.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../block_user_cuibt.dart';

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

  final List<String> reportReasons = [
    'Objectionable Content',
    'Spam',
    'Inappropriate Behavior',
    'Bad Content',
    'Fake Profile',
    'Other',
  ];



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlockUserCubit(),

      child: Scaffold(
        appBar: AppBar(
          title: const Boyo3AppBarLogo(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: LayoutBuilder(
            builder: (context, constraints){
              double screenWidth = MediaQuery.of(context).size.width;
              double imageWidth = screenWidth * 0.9;
              double imageHeight = imageWidth * 10;// Maintain aspect ratio
              return Column(
                children: [
                  FlutterCarousel(
                    options: CarouselOptions(
                      height: 250.0.h,
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
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
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
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
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
                    padding:  EdgeInsets.symmetric(horizontal: 10.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        verticalSpace(15),
                        ///name
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                  HomeCubit.get(context).isArabic
                                      ? vehicleModel.title
                                      : vehicleModel.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeightHelper.bold,
                                    color: ColorsManager.mainRed,
                                  ))),
                        ),
                        verticalSpace(15),
                        ///condition
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                        HomeCubit.get(context).isArabic
                                            ? " النوع :"
                                            : "Type :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        )),
                                    horizontalSpace(15),
                                    Text(vehicleModel.type2,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        )),
                                  ],
                                ),
                              ),
                              //const Spacer(),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                        HomeCubit.get(context).isArabic
                                            ? "الحالة :"
                                            : "Condition :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        )),
                                    horizontalSpace(10),
                                    Text(vehicleModel.type3,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///price
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      HomeCubit.get(context).isArabic
                                          ? "سنة الصنع :"
                                          : " year :",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    horizontalSpace(10),
                                    Text(
                                      vehicleModel.yearMake,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //horizontalSpace(5),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                        HomeCubit.get(context).isArabic
                                            ? "السعر : "
                                            : "Price : ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        )),
                                    horizontalSpace(10),
                                    Text(
                                      "${vehicleModel.price} AED",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: Colors.black54,
                                      ),
                                      // style:  TextStyle(
                                      //     fontWeight: FontWeight.w400,
                                      //     fontSize: 15.0,
                                      //     color: Colors.red[900]
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              if(vehicleModel.kilometer != 0)
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? " الكيلومتر :"
                                            : " Kilometer :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.kilometer.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                        HomeCubit.get(context).isArabic
                                            ? "الضمان : "
                                            : "Warranty : ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        )),
                                    horizontalSpace(10),
                                    Text(
                                      vehicleModel.warranty,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                        verticalSpace(15),
                        defaultLine(),
                        verticalSpace(15),

                        /// number of cylinders
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: vehicleModel.type1 !="tools" ?
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      HomeCubit.get(context).isArabic
                                          ? " عدد الاسطوانات :"
                                          : "Number Cylinders :",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    horizontalSpace(10),
                                    Text(
                                      vehicleModel.cylinders.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeightHelper.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    //const Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ) : Container(),
                        ),

                        if (vehicleModel.height != 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? " طول الكرفان :"
                                            : " Caravan height :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.height.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
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
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? " نوع المولد :"
                                            : " Generator Type :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.generatorType,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      //const Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        if (vehicleModel.size != ApiConstants.noData)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? "الحجم : "
                                            : "Size :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.size,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                              ],
                            ),
                          ),
                        verticalSpace(15),
                        defaultLine(),
                        verticalSpace(15),


                        if (vehicleModel.normalOrSaylant != ApiConstants.noData)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? "عادي او سايلنت : "
                                            : "Normal Or Saylant :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.normalOrSaylant,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                              ],
                            ),
                          ),

                        if (vehicleModel.numberOfParson != 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? "كم شخص يسع  : "
                                            : "How many people can it hold :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.numberOfParson.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                              ],
                            ),
                          ),


                        verticalSpace(15),

                        /// number of cylinders
                        if (vehicleModel.airConditionCount != ApiConstants.noData)
                          defaultLine(),

                        verticalSpace(15),
                        ///air condition
                        //if (vehicleModel.airConditionCount != ApiConstants.noData)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? " عدد تكييف الهواء:"
                                            : "Air Condition Count :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.airConditionCount.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                              ],
                            ),
                          ),

                        //if (vehicleModel.airConditionSize != ApiConstants.noData)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? " حجم تكييف الهواء:"
                                            : "Air Condition Size :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.airConditionSize.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                              ],
                            ),
                          ),

                        //if (vehicleModel.airConditionType != ApiConstants.noData)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).isArabic
                                            ? " نوع تكييف الهواء:"
                                            : "Air Condition Type :",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text(
                                        vehicleModel.airConditionType,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                              ],
                            ),
                          ),
                        verticalSpace(15),
                        defaultLine(),
                        verticalSpace(15),

                        /// colors

                        if (vehicleModel.colorOut != ApiConstants.noData &&
                            vehicleModel.colorIn != ApiConstants.noData)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              children: [
                                if (vehicleModel.colorOut != ApiConstants.noData)
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          HomeCubit.get(context).isArabic
                                              ? " اللون الخارجي :"
                                              : " Color Out :",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeightHelper.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        horizontalSpace(0),
                                        Text(
                                          vehicleModel.colorOut,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeightHelper.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),



                                if (vehicleModel.colorIn != ApiConstants.noData)
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          HomeCubit.get(context).isArabic
                                              ? " اللون الداخلي :"
                                              : " Color in :",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeightHelper.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        horizontalSpace(5),
                                        Text(
                                          vehicleModel.colorIn,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeightHelper.bold,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                              ],
                            ),
                          ),

                        verticalSpace(15),
                        defaultLine(),
                        verticalSpace(15),

                        ///description

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  HomeCubit.get(context).isArabic
                                      ? "الوصف :"
                                      : "Description :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  vehicleModel.description,

                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeightHelper.bold,
                                    color: Colors.black54,
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///تحذير
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  HomeCubit.get(context).isArabic
                                      ? "منصة بيوع غير مسؤولة عن عمليات البيع والشراء والتبادل التجاري، وتنصح بأخذ الحيطة والحذر وتوثيق عمليات البيع و الشراء و التدابير الوقائية حسب المتبع في كل دولة"
                                      : "The platform does not allow any sale transaction made using its services, and it is advised to take caution and document purchases. Preventive measures are in place.Every country",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeightHelper.bold,
                                    color: ColorsManager.mainRed,
                                  ),
                                ),
                              ),

                            ],
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
                            horizontalSpace(20),
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
                            horizontalSpace(20),
                            Expanded(
                              child: AppTextButton(
                                buttonText: HomeCubit.get(context).isArabic
                                    ? 'الموقع '
                                    : 'location',
                                textStyle: TextStyles.font16WhiteSemiBold,
                                onPressed: () async {
                                  goToLocationOnMap();
                                },
                              ),
                            ),
                          ],
                        ),

                        verticalSpace(20),
                        // AppTextButton(
                        //   buttonText: HomeCubit.get(context).isArabic
                        //       ? 'الذهاب الي موقع المعاينة'
                        //       : 'Go to location',
                        //   textStyle: TextStyles.font16WhiteSemiBold,
                        //   onPressed: () async {
                        //     goToLocationOnMap();
                        //   },
                        // ),
                        // verticalSpace(20),

                        Row(
                          children: [
                            Expanded(
                              child: AppTextButton(
                                buttonText: HomeCubit.get(context).isArabic
                                    ? 'حظر'
                                    : 'Block',
                                textStyle: TextStyles.font16WhiteSemiBold,
                                onPressed: () async {
                                  BlocProvider.of<BlockUserCubit>(context).blockUser(userId!, vehicleModel.userId);
                                  context.pop();
                                },
                              ),
                            ),
                            horizontalSpace(20),

                            Expanded(
                              child: AppTextButton(
                                buttonText: HomeCubit.get(context).isArabic
                                    ? 'ابلاغ'
                                    : 'Report',
                                textStyle: TextStyles.font16WhiteSemiBold,
                                onPressed: () async {
                                  //BlocProvider.of<BlockUserCubit>(context).reportUser(userId!, vehicleModel.id, reportText);
                                  // Show the report dialog
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                            HomeCubit.get(context).isArabic
                                                ? 'اختر السبب'
                                                ' (مع العلم انه بناءً على تقارير المحتوى غير المقبول في غضون 24 ساعة سيتم إزالة المحتوى وطرد المستخدم الذي قدم المحتوى المسيء) '
                                                : 'Select a Reason (Please note that based on reports of objectionable content, the content will be removed within 24 hours and the user who provided the offensive content will be removed.)',
                                          style: TextStyle(
                                            color: ColorsManager.mainRed
                                          ),
                                        ),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: reportReasons.map((reason) {
                                              return ListTile(
                                                title: Text(reason),
                                                onTap: () {
                                                  BlocProvider.of<BlockUserCubit>(context).reportUser(userId!, vehicleModel.id, reason);
                                                  Navigator.of(dialogContext).pop(); // Close the dialog
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text(
                                              HomeCubit.get(context).isArabic
                                                  ? 'خروج '
                                                  : 'Cancel',
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Close the dialog
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            horizontalSpace(13),
                            // Expanded(
                            //   child: AppTextButton(
                            //     buttonText: HomeCubit.get(context).isArabic
                            //         ? 'تصفية '
                            //         : 'Filter',
                            //     textStyle: TextStyles.font16WhiteSemiBold,
                            //     onPressed: () async {
                            //
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                        verticalSpace(20),
                      ],
                    ),
                  )
                ],
              );
            },

          ),
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
