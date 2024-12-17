import 'dart:convert';

import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/screens/drawer/allAdsForUserApproved/service_approve_model.dart';
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
import '../../../cubit/home_cubit/home_cubit.dart';
import '../drawer_screens/allServicePending/ad_model.dart';
import '../drawer_screens/allServicePending/ad_service.dart';



//Get All Services for user
class AllServicesApprovedScreen extends StatefulWidget {
  const AllServicesApprovedScreen({super.key});

  @override
  State<AllServicesApprovedScreen> createState() => _AllServicesApprovedScreenState();
}


class _AllServicesApprovedScreenState extends State<AllServicesApprovedScreen> {

  late Future<List<Ad>> futureAds;
  final AdService adService = AdService(baseUrl: ApiConstants.apiBaseUrl);


  @override
  void initState() {
    super.initState();
    futureAds = adService.fetchApprovedServicesForUser(userId!);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [

            Boyo3AppBarLogo(),
            SizedBox(width: 6,),
            Text("Approved Service"),
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
            return Center(child: Text('No Service approved here'));
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
                    ad.description!:ad.description!,
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
                        'https://backend.boyo3.com/${ad.image1!}',

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
                  trailing:
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ad.isApproved! ? Text("Approved",
                        style: TextStyle(fontSize: 15,color: Colors.green),
                        overflow: TextOverflow.ellipsis,) :
                      Text("Waiting",
                        style: TextStyle(fontSize: 15,color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5,),
                      AppTextButton(
                        backgroundColor: ColorsManager
                            .mainRed,
                        buttonWidth: 10,
                        buttonText: HomeCubit.get(context).isArabic
                            ? 'حذف'
                            : 'Delete',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () async {
                          try {
                            //call
                            await adService.deleteService(ad.id!, userId!);
                            print("Ad id is ===>>${ad.id}");
                            print("userId is ===>>${userId}");
                            setState(() {
                              futureAds = adService.fetchApprovedServicesForUser(userId!);
                            });
                          } catch (e) {
                            print("Ad id is ===>>${ad.id}");
                            print("userId is ===>>${userId}");
                            // print("id is ===>>${ad.id}");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to delete service: $e')),
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
