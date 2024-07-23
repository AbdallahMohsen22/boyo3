import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/features/home_features/cubit/home_cubit/home_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_service/gold_service_widgets.dart';
import 'package:boyo3_v1/features/home_features/screens/home/gold_vehicles/gold_vehicles.dart';
import 'package:boyo3_v1/features/home_features/screens/home/home_category/home_category.dart';
import 'package:boyo3_v1/features/home_features/screens/home/statics_data_for_home/widgets/home_contact_us.dart';
import 'package:boyo3_v1/features/home_features/screens/home/statics_data_for_home/widgets/home_place_widgets.dart';
import 'package:boyo3_v1/features/home_features/screens/home/news/news_widgets/get_all_news.dart';
import 'package:boyo3_v1/features/home_features/screens/home/products/products_home.dart';
import 'package:boyo3_v1/features/home_features/screens/home/statics_data_for_home/widgets/how_we_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late TabController secondTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    secondTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: PopupMenuButton(
                icon: const Icon(
                  IconlyBold.filter,
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            HomeCubit.get(context).isArabic
                                ? 'البحث عن الادوات والمركبات'
                                : "Search For Vehicles and tools",
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          const Icon(
                            IconlyLight.search,
                          )
                        ],
                      ),
                      onTap: () {
                        context.pushNamed(Routes.searachVehicle);
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            HomeCubit.get(context).isArabic
                                ? 'البحث عن الخدمات'
                                : "Search For Service",
                            style: TextStyles.font15BlackBold,
                          ),
                          const Spacer(),
                          const Icon(
                            IconlyLight.search,
                          )
                        ],
                      ),
                      onTap: () {
                        context.pushNamed(Routes.searachServices);
                      },
                    )
                  ];
                }),
            title: Text(
              HomeCubit.get(context).isArabic ? 'بيوع.كوم' : "Boyo3.com",
              style: TextStyles.font18BlackBold,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    context.pushNamed(Routes.drawerScreen);
                  },
                  icon: const Icon(Icons.settings
                    // IconlyBroken.setting,
                    // color: Colors.black,
                  ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const GetAllNews(),
                  const GoldVehicles(),
                  HomeCategory(),
                  const GetProductsForHome(),
                  GoldServiceWidgetForHome(),
                  const HowWeWorkWidget(),
                  const PlaceWidgets(),
                  const ContactUsForHome(),
                  verticalSpace(25)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
