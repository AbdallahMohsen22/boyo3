import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/data/models/shop/shop_items_model.dart';

class ShopRepo {
  final ApiService apiService;
  ShopRepo(this.apiService);
  Future<ApiResult<List<ShopItemModel>>> getAllAdsProducts() async {
    try {
      var response = await apiService.getAllProduct(
        // ApiConstants.tokenBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

    Future<ApiResult<List<ShopItemModel>>> searchProduct({
      required String productName
    }) async {
    try {
      var response = await apiService.searchProduct(
        // ApiConstants.tokenBody,
         productName,

      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
