import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/network/api_constants.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widgets/app_text_booton.dart';
import '../../../../../../core/widgets/boyo3_logo.dart';
import '../../../../../../core/widgets/shared_constants.dart';
import '../../../../cubit/home_cubit/home_cubit.dart';
import '../allServicePending/ad_model.dart';
import '../allServicePending/ad_service.dart';

class PostView extends StatefulWidget {
  const PostView({super.key, required this.adId});
  final int adId;

  @override
  State<PostView> createState() => _PostViewState();
}


class _PostViewState extends State<PostView> {
  late Future<List<Ad>> futureAds;
  final AdService adService = AdService(baseUrl: ApiConstants.apiBaseUrl);

  @override
  void initState() {
    super.initState();


    futureAds = adService.fetchPendingAds();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Boyo3AppBarLogo(),
      ),
      body: FutureBuilder<List<Ad>>(


        future: futureAds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No pending ads'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                double screenWidth = MediaQuery.of(context).size.width;
                double imageWidth = screenWidth * 0.6;
                double imageHeight = imageWidth * 0.6;
                Ad ad = snapshot.data![index];
                return Column(

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
                        slideIndicator:  const CircularSlideIndicator(
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
                              "${ApiConstants.apiBaseUrlForImage}${ad.image1}",
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
                              "${ApiConstants.apiBaseUrlForImage}${ad.image2}",
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
                              "${ApiConstants.apiBaseUrlForImage}${ad.image3}",
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
                                      ? " العنوان: ${ad.title} "
                                      :"Title:  ${ad.title}",
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
                                    Text(ad.type2!,
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
                                    Text(ad.type3!,
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
                                      ? "الدولة :"
                                      : " country :",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold,
                                ),
                                Text(ad.country!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold),
                                horizontalSpace(10),

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
                                  "${ad.price} AED",
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


                          verticalSpace(5),


                          /// Status
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  HomeCubit.get(context).isArabic
                                      ? " الحالة :"
                                      : "Status :",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold,
                                ),
                                ad.isApproved! ?Text("تم القبول علي الاعلان",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold) :
                                Text(HomeCubit.get(context).isArabic ?
                                "لم يتم قبول الاعلان حتي الان":
                                "Not Accepted yet",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold),
                                horizontalSpace(10),
                                const Spacer(),
                              ],
                            ),
                          ),
                          /// المدينة
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  HomeCubit.get(context).isArabic
                                      ? " المدينة :"
                                      : "City :",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold,
                                ),
                                Text(ad.city!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold),

                                const Spacer(),
                              ],
                            ),
                          ),
                          /// الرقم
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  HomeCubit.get(context).isArabic
                                      ? " الرقم :"
                                      : "Phone :",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font15BlackBold,
                                ),
                                Text(ad.phoneNumber!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font14GreyBold),

                                const Spacer(),
                              ],
                            ),
                          ),




                          verticalSpace(10),



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
                              ad.description!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]!,
                                  fontSize: 15.0.sp),
                            ),
                          ),

                          verticalSpace(10),
                          defaultLine(),
                          defaultLine(),
                          defaultLine(),


                          verticalSpace(10),


                        ],
                      ),
                    ),
                  ],
                );
              },
            );

          }
        },
      ),
    );
  }
}
