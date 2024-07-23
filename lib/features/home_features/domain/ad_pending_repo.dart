

import '../../../core/network/api_error_handler.dart';
import '../../../core/network/api_result/api_result.dart';
import '../../../core/network/api_service/api_service.dart';
import '../screens/drawer/drawer_screens/allServicePending/ad_model.dart';

class AdsRepo{
  final ApiService apiService;
  AdsRepo (this.apiService);
  Future<ApiResult<List<Ad>>> getllAllPending()async{
    try{
      var response=await apiService.getllAllPending();

      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
