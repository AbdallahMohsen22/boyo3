import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/features/home_features/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/sliver_grid_with_height.dart';
import '../../../cubit/home_cubit/home_cubit.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(HomeCubit.get(context).isArabic ? "الأقسام" : 'Categories',
                style: TextStyles.font18BlackBold),
            const Spacer(),

            // TextButton(
            //     onPressed: () {
            //       context.pushNamed(Routes.categoriesScreen);
            //     },
            //     child: Text(HomeCubit.get(context).isArabic ? 'المزيد' : "More",
            //         style: TextStyles.font15MainRed))
          ],
        ),
        verticalSpace(15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount:3,
                  crossAxisSpacing: 25.w,
                  mainAxisSpacing: 20.h,
                  height:95.h),
          itemBuilder: (_, index) {
            return CategoryItem(
                    title: HomeCubit.get(context).isArabic?HomeCubit.get(context).categoriesArabicNames[index]:HomeCubit.get(context).categoriesEnglishNames[index],
                    icons: HomeCubit.get(context).categoriesIcon[index],
                    screenName: HomeCubit.get(context).categoriesScreen[index],
                    arguments: HomeCubit.get(context).arguments[index], 
                    index: index,
            );
          },
          itemCount:HomeCubit.get(context).categoriesIcon.length,
        ),
      ],
    );
  }
}
