import 'package:boyo3_v1/core/widgets/sliver_grid_with_height.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdsScreen extends StatelessWidget {
  const AddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                height: 115.h),
                        itemBuilder: (_, index) {
                          return CategoryItem(
                            index: index,
                            title: HomeCubit.get(context).isArabic
                                ? HomeCubit.get(context)
                                    .addAdsArabicCategory[index]
                                : HomeCubit.get(context)
                                    .addAdsEnglishCategory[index],
                            icons: HomeCubit.get(context)
                                .addsCategoriesIcon[index],
                            screenName: HomeCubit.get(context)
                                .adsCategoriesScreen[index],
                            arguments:
                                HomeCubit.get(context).addAdsArguments[index],
                          );
                        },
                        itemCount:
                            HomeCubit.get(context).addAdsArguments.length,
                      ),
                    ),
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
