import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../core/theming/colors.dart';



class VehiclesWidget extends StatelessWidget {
  final VehicleModel vehicleModel;
  VehiclesWidget({required this.vehicleModel, });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints){
        // Get screen orientation
        var orientation = MediaQuery.of(context).orientation;
        double imageWidth = constraints.maxWidth * 0.4;
        double imageHeight = imageWidth * 0.6;

        // if (orientation == Orientation.portrait) {
        //   imageWidth = constraints.maxWidth * 0.8;
        //   imageHeight = imageWidth * 0.6; // Maintain aspect ratio
        // } else {
        //   imageWidth = constraints.maxWidth;
        //   imageHeight = constraints.maxHeight;
        // }
        return Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 10.0.w, vertical: 10.0.h),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.vehicleDetails, arguments: vehicleModel);
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
                        "${ApiConstants.apiBaseUrlForImage}${vehicleModel.image1}",

                        //"http://andrewfayez-001-site1.ltempurl.com/${vehicleModel.image1}",
                        fit: BoxFit.fill,
                        httpHeaders: const {
                          ApiConstants.tokenTitle:ApiConstants.tokenBody
                        },
                        width: imageWidth,
                        height: imageHeight,
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
                            vehicleModel.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0.sp),
                          ),

                          ///price
                          Text(
                              "${vehicleModel.price} AED",
                              textDirection: TextDirection.ltr,
                              style: TextStyles.font15MainRed
                          ),
                          verticalSpace(10),

                          Text(
                              vehicleModel.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font14GreyBold
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
      },
    );
  }
}
