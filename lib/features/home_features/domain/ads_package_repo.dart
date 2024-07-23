import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/data/models/add_package_response/add_package_response.dart';
import 'package:boyo3_v1/features/home_features/data/models/packages/package_model.dart';




class AdsPackagesRepo{
  final ApiService apiService;
  AdsPackagesRepo (this.apiService);
  Future<ApiResult<List<PackageModel>>> getAllAdsPackages()async{
    try{
      var response=await apiService.getAllAdsPackages();
      return ApiResult.success(
        response
        // response.sort(((a, b) => a.id.compareTo(b.id)))
      
      );
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<List<PackageModel>>> getUserAdsPackages({
    required String userId
  })async{
    try{
      var response=await apiService.getUserAdsPackages(
        userId
      );
      return ApiResult.success(
        response      
      );
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserAddPackageModel>> userAddPackage({
    required int packageId,
    required String userId,

  })async{
    try{
      var response=await apiService.userAddPackage(
        // ApiConstants.tokenBody,
        packageId,
        userId
       );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
