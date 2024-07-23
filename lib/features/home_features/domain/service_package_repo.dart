import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/data/models/add_package_response/add_service_package_response.dart';
import 'package:boyo3_v1/features/home_features/data/models/packages/service_package_model.dart';




class ServicesPackagesRepo{
  final ApiService apiService;
  ServicesPackagesRepo (this.apiService);
  Future<ApiResult<List<ServicePackageModel>>> getAllAdsPackages()async{
    try{
      var response=await apiService.getAllServicesPackages(
       );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ServicePackageModel>>> getUserServicesPackages({
    required String userId
  })async{
    try{
      var response=await apiService.getUserServicesPackages(
        userId
       );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserAddServicePackageModel>> userAddPackage({
    required int packageId,
    required String userId,

  })async{
    try{
      var response=await apiService.userAddServicePackage(
        packageId,
        userId
       );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
