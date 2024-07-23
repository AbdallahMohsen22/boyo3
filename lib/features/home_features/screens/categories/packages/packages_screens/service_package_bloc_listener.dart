

import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/theming/colors.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesPackagesBlocListener extends StatelessWidget {
  const ServicesPackagesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAddServicesPackagesCubit, ServicePackagesState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (servicePackageResponse) async {
            context.pop();
            Constants.showToast(msg: servicePackageResponse.message);
          },
          error: (error) {
            setupErrorState(
              context,
              error.toString()
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
