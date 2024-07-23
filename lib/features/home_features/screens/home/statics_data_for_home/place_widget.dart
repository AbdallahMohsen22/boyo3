import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';


class PlaceWidget extends StatelessWidget {
  final String? placeImageUrl;
  final String? placeName;
  //final String? numberOfAds;
  PlaceWidget({
    required this.placeName,
    required this.placeImageUrl,
    //required this.numberOfAds,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.black26,
                  offset: Offset(5, 5))
            ],
            borderRadius:
            BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white
                ])),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),

              child: CachedNetworkImage(
                imageUrl:placeImageUrl!,
                fit: BoxFit.fill,
                height: 120.h,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                  child: Text(
                    'Loading ...',
                    style: TextStyle(
                        color: Colors.green, fontSize: 15.0),
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),

              //Image.network(widget.product.imageUrl)
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  horizontalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        placeName!,
                        style: TextStyles.font20BlackBold
                      ),
                     
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    IconlyBold.location
                  )

                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
