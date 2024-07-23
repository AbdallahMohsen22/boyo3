import 'dart:io';

import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/search_service_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/service_model.dart';

class ServiceRepo {
  final ApiService apiService;
  ServiceRepo(this.apiService);

  Future<ApiResult<List<ServiceModel>>> getServiceByFilter({
    required String service,
  }) async {
    try {
      var response = await apiService.getServiceByFilter(service);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ServiceModel>>> getServiceFromHomeOrOut({
    required String service,
    required String type,
  }) async {
    try {
      var response = await apiService.getServiceOutOrForHome(
        service,
        type,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ServiceModel>>> getWorkShopAndExhibition({
    required String service,
    required String type,
  }) async {
    try {
      var response = await apiService.getWorkShopAndExhibition(
        service,
        type,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<SearchServiceModel>>> searchService({
    required String ServiceName,
  }) async {
    try {
      var response = await apiService.searchService(
        ServiceName,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ServiceModel>>> getAllGoldService() async {
    try {
      var response = await apiService.getAllGoldService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //getServiceByCountry
  Future<ApiResult<List<ServiceModel>>> getServiceByCountry({
    required String servName,required String country
  }) async {
    try {
      var response = await apiService.getServiceByCountry(
          servName, country
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ServiceModel>> addService({
    required String userId,
    required String title,
    required String type,
    required String type2,
    required String type3,
    required int price,
    required File image1,
    required File image2,
    required File image3,
    required String phoneNumber,
    required String whatsAppNumber,
    required String description,
    required String warranty,
    required String country,
    required String city,
    required String longitude,
    required String latitude,
    required int countDay,
    required int countPerson,
    required String fromCountry,
    required String toCountry,
    required String createdDate,
  }) async {
    try {
      var response = await apiService.addService(
        userId,
        title,
        type,
        type2,
        type3,
        price,
        image1,
        image2,
        image3,
        phoneNumber,
        whatsAppNumber,
        description,
        warranty,
        country,
        city,
        longitude,
        latitude,
        countDay,
        countPerson,
        fromCountry,
        toCountry,
        createdDate,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
