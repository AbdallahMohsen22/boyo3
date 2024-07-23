import 'package:boyo3_v1/core/helpers/extensitions.dart';
import 'package:boyo3_v1/core/theming/styles.dart';
import 'package:boyo3_v1/core/widgets/shared_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../cubit/home_cubit/home_cubit.dart';
import '../../../categories/vehicles/cubit/vehicle_cubit.dart';
import '../../../categories/vehicles/cubit/vehicle_states.dart';

class AddVehiclesBlocListener extends StatelessWidget {
  const AddVehiclesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VehicleCubit, VehicleState>(
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
          success: (loginResponse) async {
            context.pop();
            Constants.showToast(msg: "تمت الاضافه بنجاح");
          },
          error: (error) {
            setupErrorState(
              context,
              "حدث خطا ما برجاء المحاوله مره اخرى ",
            );
            Constants.showToast(msg: error.toString(),color: Colors.black);
            context.pop();
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
