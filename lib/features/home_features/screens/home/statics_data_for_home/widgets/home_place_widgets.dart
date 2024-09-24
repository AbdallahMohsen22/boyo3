
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/home/statics_data_for_home/place_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceWidgets extends StatefulWidget {
  const PlaceWidgets({super.key});

  @override
  State<PlaceWidgets> createState() => _PlaceWidgetsState();
}

class _PlaceWidgetsState extends State<PlaceWidgets> {
  @override
  Widget build(BuildContext context) {
    List<String> placeName = [
      HomeCubit.get(context).isArabic ? "السعوديه" : "Saudia Arabia",
      HomeCubit.get(context).isArabic ? "الإمارات" : 'The UAE',
      HomeCubit.get(context).isArabic ? "البحرين" : 'Bahrain',
    ];
    List<String> placeImage = [
      "https://www.edarabia.com/ar/wp-content/uploads/2021/07/learn-about-saudi-arabia-4-information-about-largest-country-arab-world.jpg",
      "https://www.albayan.ae/polopoly_fs/1.3915686.1595104328!/image/image.jpg",
      "https://7enews.net/wp-content/uploads/2023/06/%D8%A7%D9%84%D8%A8%D8%AD%D8%B1%D9%8A%D9%86.jpg",
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              HomeCubit.get(context).isArabic
                  ? "أينما كنت، نحن معك"
                  : 'Wherever you are,we are with you',
              textAlign: TextAlign.start,
              style: TextStyles.font18BlackBold
            ),
            
           
          ],
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 190.h,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 15 / 14,
            autoPlayCurve: Curves.linear,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            viewportFraction: 1.00,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return PlaceWidget(
                placeName: placeName[index],
                placeImageUrl: placeImage[index],
                // numberOfAds: placeAds[index]
                );
          },
          itemCount: 3,
        ),
      ],
    );
  }
}
