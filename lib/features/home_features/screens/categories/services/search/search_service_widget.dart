import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/search_service_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../core/theming/colors.dart';



class ServiceWidgetForSearch extends StatelessWidget {
  final SearchServiceModel serviceModel;
  ServiceWidgetForSearch({required this.serviceModel, });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 8.0.w, vertical: 3.0.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.serviceDetails, arguments: serviceModel);
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 4, color: Colors.black26, offset: Offset(5, 5))
              ],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [Colors.white, Colors.white])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
      
                  child: CachedNetworkImage(
                    imageUrl: 
                      "${ApiConstants.apiBaseUrlForImage}${serviceModel.image1}",
                    fit: BoxFit.fill,
                    httpHeaders: const {
                      ApiConstants.tokenTitle:ApiConstants.tokenBody
                    },
                    width: 120.w,
                    height: 80.h,
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
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                        ),
                
                horizontalSpace(5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///name
                      Text(
                        serviceModel.title,   
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
      
                      ///price
                      Text(
                          "${serviceModel.price} AED",
                        textDirection: TextDirection.ltr,
                        style: TextStyles.font15MainRed
                      ),
                      verticalSpace(5),
     
                      Text(
                        serviceModel.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font13GreyBold
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
