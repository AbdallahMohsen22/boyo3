import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowWeWorkWidget extends StatelessWidget {
  const HowWeWorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Container(
                width: double.infinity,
                color: Colors.red[900],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          HomeCubit.get(context).isArabic?
                          'آلية العمل':"Mechanism Of Action",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                            height: 2,
                            width: 50.w,
                            color: Colors.yellow
                            ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Container(
                          height: 2,
                            width: 30.w,
                            color: Colors.yellow
                            ),
                        verticalSpace(10),
                        Text(
                          HomeCubit.get(context).isArabic?
                          'كيف نعمل':"How Do We Work",
                          style: TextStyles.font15WhiteBold,
                        ),



                      ],
                    ),
                  ),
                ),
              ),
              Image.asset(
                HomeCubit.get(context).isArabic?
                "assets/images/mechanism.png":"assets/images/mechanism_en.png",
                width: double.infinity,
                height: 150,
              ),
      ],
    );
  }
}