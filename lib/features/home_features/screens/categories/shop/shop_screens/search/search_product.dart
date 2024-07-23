import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/helpers/spacing.dart';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/app_text_form_field.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: context.read<ShopCubit>().searchNameController,
                    hintText: "Search",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك قم بادخال اسم ';
                      }
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      context.pushNamed(Routes.searchProductResultScreen,
                      arguments:context.read<ShopCubit>().searchNameController.text
                      );
                    },
                    icon: const Icon(IconlyBold.send)),
              ],
            ),
            verticalSpace(80),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Suggetions',
                      style: TextStyles.font14GreyBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
