import 'package:boyo3_v1/features/home_features/domain/service_package_repo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesPackagesCubit extends Cubit<ServicePackagesState> {
  final ServicesPackagesRepo _servicesPackageRepo;
  ServicesPackagesCubit(this._servicesPackageRepo)
      : super(const ServicePackagesState.initial());

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  void emitGetAllPackagesStates() async {
    
    emit(const ServicePackagesState.loading());
    final response = await _servicesPackageRepo.getAllAdsPackages();
    response.when(success: (getServicesPackageResponse) {
      emit(ServicePackagesState.success(getServicesPackageResponse));
    }, failure: (error) {
      emit(ServicePackagesState.error(
          error: error.apiErrorModel.messages ?? ''));
    });
  }

   void emitGetUserPackagesStates({
      required String userId
    }) async {
    emit(const ServicePackagesState.loading());
    final response = await _servicesPackageRepo.getUserServicesPackages(
      userId: userId
      );
    response.when(success: (getAdsPackageResponse) {
      emit(ServicePackagesState.success(getAdsPackageResponse));
    }, failure: (error) {
      emit(ServicePackagesState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }


}



//Service pakages
class UserAddServicesPackagesCubit extends Cubit<ServicePackagesState> {
  final ServicesPackagesRepo _servicesPackageRepo;
  UserAddServicesPackagesCubit(this._servicesPackageRepo)
      : super(const ServicePackagesState.initial());

    String? message;
    void emitUserAddPackageStates({
    required int packageId,
    required String userId,
  }) async {
    emit(const ServicePackagesState.loading());
    final response = await _servicesPackageRepo.userAddPackage(
      packageId: packageId,
      userId: userId,
    );
    response.when(success: (userAddServicesPackageResponse) {
      message = userAddServicesPackageResponse.message;
      emit(ServicePackagesState.success(userAddServicesPackageResponse));
      print("Api response=====>>>>>${response}");
    }, failure: (error) {
      emit(ServicePackagesState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }


}

