import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/data/models/news/news_model.dart';

class NewsRepo{
  final ApiService apiService;
  NewsRepo (this.apiService);
  Future<ApiResult<List<NewsModel>>> getAllNews()async{
    try{
      var response=await apiService.getAllNews(
        // ApiConstants.tokenBody,
       );
      
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
