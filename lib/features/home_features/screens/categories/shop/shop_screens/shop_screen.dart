import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/widgets/boyo3_logo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../shop_cubit/shop_cubit.dart';
import '../shop_widgets/shop_item_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    getAllProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(Routes.searchProductScreen);
              },
              icon: Icon(
                IconlyBroken.search,
                color: ColorsManager.mainRed,
              ))
        ],
        title: Boyo3AppBarLogo(),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(10),
            BlocBuilder<ShopCubit, ShopState>(
                builder: (context, ShopState state) {
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
              }, success: (getAllProductResponse) {
                return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5.h,
                      );
                    },
                    itemCount: getAllProductResponse.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ShopItemWidget(
                        shopItemModel: getAllProductResponse[index],
                      );
                    });
              }, error: (error) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_rounded,
                          size: 200,
                        ),
                        Text(
                          'Something went wrong , please try again later ',
                          style: TextStyles.font15BlackBold,
                        ),
                      ],
                    ),
                  ),
                );
              });
            })
          ],
        ),
      ),
    );
  }

  void getAllProducts(BuildContext context) {
    context.read<ShopCubit>().emitGetAllAdsProductsStates();
  }
}
