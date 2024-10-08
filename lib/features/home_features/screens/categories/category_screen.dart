import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/core/widgets/sliver_grid_with_height.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/widget/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
            
              appBar: AppBar(
                // leading: IconButton(
                //   onPressed: () {
                //     context.pushNamed(Routes.homeScreen,);
                //   },
                //   icon: const Icon(
                //     Icons.arrow_back
                //   )),
                centerTitle: false,
                title: const Boyo3AppBarLogo()
              ),
            
              body:Padding(
                padding:const EdgeInsets.all(8.0),
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
                                crossAxisCount:3,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 20.h,
                                height: 95.h),
                            itemBuilder: (_, index) {
                              return CategoryItem(
                                index: index,
                                title: HomeCubit.get(context).isArabic?HomeCubit.get(context).categoriesArabicNames[index]:HomeCubit.get(context).categoriesEnglishNames[index],
                                icons: HomeCubit.get(context).categoriesIcon[index],
                                screenName: HomeCubit.get(context).categoriesScreen[index],
                                arguments: HomeCubit.get(context).arguments[index],
                              );
                            },
                            itemCount: HomeCubit.get(context).categoriesIcon.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }





}

