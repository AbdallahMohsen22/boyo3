import 'dart:convert';

import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../../core/widgets/app_text_booton.dart';
import '../../../../../../core/widgets/boyo3_logo.dart';
import '../../../../../../core/widgets/shared_constants.dart';
import '../../../../../../core/widgets/sliver_grid_with_height.dart';
import '../../../../../basic_constants.dart';
import '../../../cubit/home_cubit/home_cubit.dart';
import '../drawer_screens/allServicePending/ad_model.dart';
import '../drawer_screens/allServicePending/ad_service.dart';



//Get All ADs for user
class AllAdsApprovedScreen extends StatefulWidget {
  const AllAdsApprovedScreen({super.key});

  @override
  State<AllAdsApprovedScreen> createState() => _AllAdsApprovedScreenState();
}


class _AllAdsApprovedScreenState extends State<AllAdsApprovedScreen> {

  late Future<List<Ad>> futureAds;
  final AdService adService = AdService(baseUrl: ApiConstants.apiBaseUrl);


  @override
  void initState() {
    super.initState();
    futureAds = adService.fetchApprovedAdsForUser(userId!);
    // futureAds = adService.fetchApprovedServicesForUser();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [

            Boyo3AppBarLogo(),
            SizedBox(width: 6,),
            Text("Approved Ads"),
          ],
        ),
      ),

      body: FutureBuilder<List<Ad>>(

        future: futureAds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No ads approved here'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Ad ad = snapshot.data![index];
                return ListTile(
                  title: Text(
                    HomeCubit.get(context).isArabic?
                    ad.title!:ad.title!,
                    maxLines: 1,
                    style: TextStyles.font12BlackBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    HomeCubit.get(context).isArabic?
                    ad.fullName!:ad.fullName!,
                    maxLines: 1,
                    style: TextStyles.font12BlackBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Container(
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
                        'http://boyo33-001-site1.ktempurl.com/${ad.image1}',

                        //"http://andrewfayez-001-site1.ltempurl.com/${getAllProductResponse[index].image1}",
                        fit: BoxFit.fill,
                        httpHeaders: const {
                          ApiConstants.tokenTitle:
                          ApiConstants.tokenBody
                        },
                        width: 100,
                        height: 100,
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ad.isApproved! ?Text("Approved",
                        style: TextStyle(fontSize: 15,color: Colors.green),
                        overflow: TextOverflow.ellipsis,)  :
                      Text("Waiting",
                        style: TextStyle(fontSize: 15,color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(width: 2,),
                      AppTextButton(
                        backgroundColor: ColorsManager
                            .mainRed,
                        buttonWidth: 5,
                        buttonText: HomeCubit.get(context).isArabic
                            ? 'حذف'
                            : 'Delete',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () async {
                          try {
                            //call
                            await adService.deleteAd(ad.id!, userId!);
                            print("AD id is ===>>${ad.id}");
                            print("User id is ===>>${userId}");

                            setState(() {
                              futureAds = adService.fetchApprovedAdsForUser(userId!);
                            });
                          } catch (e) {
                            print("AD id is ===>>${ad.id}");
                            print("User id is ===>>${userId}");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to delete ad: $e')),
                            );


                          }
                        },
                      ),
                    ],
                  )
                );
              },
            );

          }
        },
      ),
    );
  }

}
