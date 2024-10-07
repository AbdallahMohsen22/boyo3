import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldWidget extends StatelessWidget {
  final VehicleModel vehicle;
  GoldWidget({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, left: 2.0.w, right: 2.w, bottom: 2.h),
        child: InkWell(
          onTap: () {
            context.pushNamed(Routes.vehicleDetails, arguments: vehicle);
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.5, color: Colors.black)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),

                  child: CachedNetworkImage(
                    imageUrl:
                      "${ApiConstants.apiBaseUrlForImage}${vehicle.image1}",

                        //"http://andrewfayez-001-site1.ltempurl.com/${vehicle.image1}",
                    fit: BoxFit.fill,
                    height: 90.h,
                    width: 90.w,
                    httpHeaders: const {
                      ApiConstants.tokenTitle: ApiConstants.tokenBody
                    },
                    placeholder: (context, url) => const Center(
                      child: Text(
                        'Loading ...',
                        style: TextStyle(color: Colors.green, fontSize: 15.0),
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
                child: Text(vehicle.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font13BlackBold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
