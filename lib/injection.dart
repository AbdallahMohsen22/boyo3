import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/auth_features/domain/login_repo.dart';
import 'package:boyo3_v1/features/auth_features/domain/register_repo.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_cubit.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_cubit.dart';
import 'package:boyo3_v1/features/home_features/domain/ad_pending_repo.dart';
import 'package:boyo3_v1/features/home_features/domain/ads_package_repo.dart';
import 'package:boyo3_v1/features/home_features/domain/service_repo.dart';
import 'package:boyo3_v1/features/home_features/domain/shop_repo.dart';
import 'package:boyo3_v1/features/home_features/domain/news_repo.dart';
import 'package:boyo3_v1/features/home_features/domain/service_package_repo.dart';
import 'package:boyo3_v1/features/home_features/domain/vehicle_repo.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/ads_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/packages/packages_cubit/services_packages/services_package_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/services/cubit/service_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/shop/shop_cubit/shop_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/categories/vehicles/cubit/vehicle_cubit.dart';
import 'package:boyo3_v1/features/home_features/screens/home/news/cubit/news_cubit.dart';
import 'package:boyo3_v1/features/profile/profile_cuibt.dart';
import 'package:boyo3_v1/features/profile/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_factory.dart';

final getIt = GetIt.instance;

void initGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  //
  //register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));

  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));

  // ads packages
  getIt.registerFactory<AdsPackagesRepo>(() => AdsPackagesRepo(getIt()));
  getIt.registerFactory<AdsPackagesCubit>(() => AdsPackagesCubit(getIt()));
  getIt.registerFactory<UserAddPackageCubit>(() => UserAddPackageCubit(getIt()));

  // service package
  getIt.registerFactory<ServicesPackagesRepo>(
      () => ServicesPackagesRepo(getIt()));
  getIt.registerFactory<ServicesPackagesCubit>(
      () => ServicesPackagesCubit(getIt()));
  getIt.registerFactory<UserAddServicesPackagesCubit>(
      () => UserAddServicesPackagesCubit(getIt()));
  //Vehicles
  getIt.registerFactory<VehicleRepo>(() => VehicleRepo(getIt()));
  getIt.registerFactory<VehicleCubit>(() => VehicleCubit(getIt()));
  //news
  getIt.registerFactory<NewsRepo>(() => NewsRepo(getIt()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt()));
  //shop
  getIt.registerFactory<ShopRepo>(() => ShopRepo(getIt()));
  getIt.registerFactory<ShopCubit>(() => ShopCubit(getIt()));

    //Service
  getIt.registerFactory<ServiceRepo>(() => ServiceRepo(getIt()));
  getIt.registerFactory<ServiceCubit>(() => ServiceCubit(getIt()));
  //UserAddServicesPackagesCubit


}
