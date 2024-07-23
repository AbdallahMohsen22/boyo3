import 'dart:io';
import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';

class VehicleRepo {
  final ApiService apiService;
  VehicleRepo(this.apiService);

  Future<ApiResult<List<VehicleModel>>> getVehicleByFilter({
    required String type1,
    required String type2,
  }) async {
    try {
      var response = await apiService.getVehicleByFilter(
        // ApiConstants.tokenBody,
        type1,
        type2,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<VehicleModel>>> searchForVehicleOrTool({
    required String vehicleOrToolName,
  }) async {
    try {
      var response = await apiService.searchAds(
        vehicleOrToolName,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<List<VehicleModel>>> getAllGoldAds() async {
    try {
      var response = await apiService.getAllGoldAds(
        // ApiConstants.tokenBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<VehicleModel>>> getGoldCaravan() async {
    try {
      var response = await apiService.getGoldCaravan(
        // ApiConstants.tokenBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<VehicleModel>>> getGoldCars() async {
    try {
      var response = await apiService.getGoldCars(
        // ApiConstants.tokenBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<VehicleModel>>> getGoldMotorcycles() async {
    try {
      var response = await apiService.getGoldMotorcycles(
        // ApiConstants.tokenBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<VehicleModel>>> getGoldTools() async {
    try {
      var response = await apiService.getGoldTools(
        // ApiConstants.tokenBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


    Future<ApiResult<List<VehicleModel>>> filterAdsByVehicleTypeAndCountry({
      required String country,
      required String vehicleType,
    }) async {
    try {
      var response = await apiService.filterAdsByVehicleTypeAndCountry(
        vehicleType,country
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

      Future<ApiResult<List<VehicleModel>>> getAdsByVehicleType1And2And3({
      required String vehicleCondition,
      required String type2,
      required String vehicleType,
    }) async {
    try {
      var response = await apiService.getVehiclesByType1And2And3(
        vehicleType,type2,vehicleCondition
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<VehicleModel>>> filterAdsByVehicleType1AndType2AndCountry({
      required String country,
      required String type2,
      required String vehicleType,
    }) async {
    try {
      var response = await apiService.filterAdsByVehicleType1AndType2AndCountry(
        vehicleType,type2,country
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

///
//   Future<ApiResult<List<VehicleModel>>> filterAdsByVehicleType1AndType2AndCity({
//       required String city,
//       required String type2,
//       required String vehicleType,
//     }) async {
//     try {
//       var response = await apiService.filterAdsByVehicleType1AndType2AndCity(
//         vehicleType,type2,city
//       );
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ErrorHandler.handle(error));
//     }
//   }

   Future<ApiResult<List<VehicleModel>>> getVehiclesByPrice({
     
      required double minPrice,required double maxPrice
    }) async {
    try {
      var response = await apiService.getVehiclesByPrice(
        minPrice,maxPrice
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


    Future<ApiResult<VehicleModel>> addCarvan({
    required String id,
    required String title,
    required String type,
    required String type2,
    required String type3,
    required String type4,
    required File image1,
    required File image2,
    required File image3,
    required int price,
    required String phoneNumber,
    required String whatsAppNumber,
    required String description,
    required String warranty,
    required String country,
    required String city,
    required String longitude,
    required String latitude,
    required String adsType,
    required String colorIn,
    required String colorOut,
    required String yearMake,
    required int cylinders,
    required int kilometer,
    required String addOns,
    required String publicStatus,
    required String faults,
    required String security,
    required String specifications,
    required String size,
    required String generatorType,
    required String airConditionType,
    required String airConditionSize,
    required String airConditionCount,
    required String normalOrSaylant,
    required int numberOfParson,
    required int height,
    required String createdDate, 
  }) async {
    try {
      var response = await apiService.addCaravan(
        // ApiConstants.tokenBody,
         id,
         title,
         type,
         type2,
         type3,
         type4,
         image1,
         image2,
         image3,
         price,
         phoneNumber,
         whatsAppNumber,
         description,
         warranty,
         country,
         city,
         longitude,
         latitude,
         adsType,
          colorIn,
          colorOut,
          yearMake,
          cylinders,
          kilometer,
          addOns,
          publicStatus,
          faults,
          security,
          specifications,
          size,
          generatorType,
          airConditionType,
          airConditionSize,
          airConditionCount,
          normalOrSaylant,
          numberOfParson,
          height,
          createdDate,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

     Future<ApiResult<VehicleModel>> addCar({
    required String id,
    required String title,
    required String type,
    required String type2,
    required String type3,
    required String type4,
    required File image1,
    required File image2,
    required File image3,
    required int price,
    required String phoneNumber,
    required String whatsAppNumber,
    required String description,
    required String warranty,
    required String country,
    required String city,
    required String longitude,
    required String latitude,
    required String adsType,
    required String colorIn,
    required String colorOut,
    required String yearMake,
    required int cylinders,
    required int kilometer,
    required String addOns,
    required String publicStatus,
    required String security,
    required String specifications,
    required String createdDate, 
  }) async {
    try {
      var response = await apiService.addCar(
        // ApiConstants.tokenBody,
         id,
         title,
         type,
         type2,
         type3,
         type4,
         image1,
         image2,
         image3,
         price,
         phoneNumber,
         whatsAppNumber,
         description,
         warranty,
         country,
         city,
         longitude,
         latitude,
         adsType,
          colorIn,
          colorOut,
          yearMake,
          cylinders,
          kilometer,
          addOns,
          publicStatus,
          security,
          specifications,
          createdDate,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

    
    

    Future<ApiResult<VehicleModel>> addMotorCycle({
    required String id,
    required String title,
    required String type,
    required String type2,
    required String type3,
    required String type4,
    required File image1,
    required File image2,
    required File image3,
    required int price,
    required String phoneNumber,
    required String whatsAppNumber,
    required String description,
    required String warranty,
    required String country,
    required String city,
    required String longitude,
    required String latitude,
    required String adsType,
    required String colorOut,
    required String yearMake,
    required int cylinders,
    required int kilometer,
    required String addOns,
    required String publicStatus,
    required String security,
    required String specifications,
    required String createdDate, 
  }) async {
    try {
      var response = await apiService.addMotorCycles(
        // ApiConstants.tokenBody,
         id,
         title,
         type,
         type2,
         type3,
         type4,
         image1,
         image2,
         image3,
         price,
         phoneNumber,
         whatsAppNumber,
         description,
         warranty,
         country,
         city,
         longitude,
         latitude,
         adsType,
         colorOut,
         yearMake,
         cylinders,
         kilometer,
         addOns,
         publicStatus,
         security,
         specifications, 
         createdDate,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

    Future<ApiResult<VehicleModel>> addTools({
    required String id,
    required String title,
    required String type,
    required String type2,
    required String type3,
    required String type4,
    required File image1,
    required File image2,
    required File image3,
    required int price,
    required String phoneNumber,
    required String whatsAppNumber,
    required String description,
    required String warranty,
    required String country,
    required String city,
    required String longitude,
    required String latitude,
    required String adsType,
    required String yearMake,
    required String addOns,
    required String publicStatus,
    required String security,
    required String specifications,
    required String createdDate, 
  }) async {
    try {
      var response = await apiService.addTools(
        // ApiConstants.tokenBody,
         id,
         title,
         type,
         type2,
         type3,
         type4,
         image1,
         image2,
         image3,
         price,
         phoneNumber,
         whatsAppNumber,
         description,
         warranty,
         country,
         city,
         longitude,
         latitude,
         adsType,
         yearMake,
         addOns,
         publicStatus,
         security,
         specifications, 
         createdDate,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}
