import 'package:boyo3_v1/features/home_features/domain/ads_package_repo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/ads_package_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsPackagesCubit extends Cubit<AdsPackagesState> {
  final AdsPackagesRepo _adsPackageRepo;
  AdsPackagesCubit(this._adsPackageRepo)
      : super(const AdsPackagesState.initial());

  String? message;
  void emitGetAllPackagesStates() async {
    emit(const AdsPackagesState.loading());
    final response = await _adsPackageRepo.getAllAdsPackages();
    response.when(success: (getAdsPackageResponse) {
      emit(AdsPackagesState.success(getAdsPackageResponse));
    }, failure: (error) {
      emit(AdsPackagesState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

    void emitGetUserPackagesStates({
      required String userId
    }) async {
    emit(const AdsPackagesState.loading());
    final response = await _adsPackageRepo.getUserAdsPackages(
      userId: userId
      );
    response.when(success: (getAdsPackageResponse) {
      emit(AdsPackagesState.success(getAdsPackageResponse));
    }, failure: (error) {
      emit(AdsPackagesState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
// Ads Packages
  void emitUserAddPackageStates({
    required int packageId,
    required String userId,
  }) async {
    emit(const AdsPackagesState.loading());
    final response = await _adsPackageRepo.userAddPackage(
      packageId: packageId,
      userId: userId,
    );
    response.when(success: (getAdsPackageResponse) {
      emit(AdsPackagesState.success(getAdsPackageResponse));
      print("Api response=====>>>>>${response}");
    }, failure: (error) {
      emit(AdsPackagesState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}

class UserAddPackageCubit extends Cubit<AdsPackagesState> {
  final AdsPackagesRepo _adsPackageRepo;
  UserAddPackageCubit(this._adsPackageRepo)
      : super(const AdsPackagesState.initial());

  String? message;

  void emitUserAddPackageStates({
    required int packageId,
    required String userId,
  }) async {
    emit(const AdsPackagesState.loading());
    final response = await _adsPackageRepo.userAddPackage(
      packageId: packageId,
      userId: userId,
    );
    response.when(success: (getAdsPackageResponse) async {
      message = getAdsPackageResponse.message;
      print("Api Response=====>>> ${getAdsPackageResponse.message}");
      emit(AdsPackagesState.success(getAdsPackageResponse));
    }, failure: (error) {
      emit(AdsPackagesState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}
