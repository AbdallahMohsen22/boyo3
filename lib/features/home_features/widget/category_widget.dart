import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit/home_cubit.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String title;
  final String icons;
  final String screenName;
  final String arguments;
  CategoryItem({
    required this.index,
    required this.title,
    required this.icons,
    required this.screenName,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ({
          int index = 0,
        }) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
             context.pushNamed(screenName , arguments: arguments);
          });
          HomeCubit.get(context).changeIndex(index);
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    offset: Offset(3, 3))
              ],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [Colors.white, Colors.white])),
          child:  Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icons,
                    color: Colors.red[900],
                    width: 60.0.w,
                    height: 40.0.h,
                  ),
                  verticalSpace(10),
                  Text(
                    '${title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font15BlackBold,
                  )
                ],
              ),
           
        ));
  }
}

class CategoryHomeItem extends StatelessWidget {
  final int index;
  final String title;
  final String icons;
  final String screenName;
  final String arguments;
  CategoryHomeItem({
    required this.index,
    required this.title,
    required this.icons,
    required this.screenName,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ({
          int index = 0,
        }) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
             context.pushNamed(screenName , arguments: arguments);
          });
          HomeCubit.get(context).changeIndex(index);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    icons,
                    color: Colors.red[900],
                    width: 50.0.w,
                    height: 30.0.h,
                  ),
                  verticalSpace(10),
                  Text(
                    '${title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font15BlackBold,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


