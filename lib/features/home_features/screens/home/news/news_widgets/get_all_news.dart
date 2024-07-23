import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/screens/home/news/cubit/news_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/home/news/cubit/news_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../core/theming/colors.dart';

class GetAllNews extends StatefulWidget {
  const GetAllNews({super.key});

  @override
  State<GetAllNews> createState() => _GetAllNewsState();
}

class _GetAllNewsState extends State<GetAllNews> {
  @override
  void initState() {
    getAllNews(context); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<NewsCubit, NewsState>(
        builder: (context, NewsState state) {
      return state.when(initial: () {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpinKitThreeBounce(
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
        );
      }, loading: () {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpinKitThreeBounce(
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
        );
      },
          success: (getAllNewsResponse) {
        return  Container(
          height: 60.h,
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
                          Colors.black,
                          Colors.black
                        ])),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: CarouselSlider.builder(
                options: CarouselOptions(
                              height: 50.0.h,
                              enlargeCenterPage: false,
                              autoPlay: true,
                              aspectRatio: 15 / 14,
                              autoPlayCurve: Curves.linear,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                              viewportFraction: 1.00,
                            ),
                         
                itemCount: getAllNewsResponse.length,
                itemBuilder: (BuildContext context, int index, int realIndex){
                  return Center(
                    child: Text( getAllNewsResponse[index].title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font15WhiteBold,
                    
                    ),
                  );
                }),
          ),
        );
      },
          error: (error) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_rounded,
                  size: 50,
                ),
                Text(
                  'Something went wrong ,check your internet \n try again later ',
                  style: TextStyles.font13BlackBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      });
    });
 
  }

  void getAllNews(BuildContext context) {
    context.read<NewsCubit>().emitGetAllNews();
  }
}
