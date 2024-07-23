import 'dart:io';

import 'package:boyo3_v1/features/auth_features/data/models/confirm_email_model.dart';
import 'package:boyo3_v1/features/auth_features/data/models/user_response.dart';
import 'package:boyo3_v1/features/home_features/data/models/add_package_response/add_package_response.dart';
import 'package:boyo3_v1/features/home_features/data/models/add_package_response/add_service_package_response.dart';
import 'package:boyo3_v1/features/home_features/data/models/news/news_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/packages/package_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/packages/service_package_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/resetPasswordModel/reset_pass_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/search_service_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/service/service_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/shop/shop_items_model.dart';
import 'package:boyo3_v1/features/home_features/data/models/vehicle/vehicle_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../features/home_features/screens/drawer/drawer_screens/allServicePending/ad_model.dart';
import '../api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  @MultiPart()
  Future<UserResponse> login(
    // @Header(ApiConstants.tokenTitle) String token,
    @Part() String Email,
    @Part() String Password,
  );

  @POST(ApiConstants.register)
  @MultiPart()
  Future<UserResponse> register(
    // @Header(ApiConstants.tokenTitle) String token,
    @Part(name: "FullName") String fullName,
    @Part(name: "Username") String username,
    @Part(name: "Email") String email,
    @Part(name: "Password") String password,
    @Part(name: "Phonenumber") String phonenumber,
    @Part(name: "longitude") String longitude,
    @Part(name: "latitude") String latitude,
    @Part(name: "ImageCover") File imageCover,
  );

  @PUT('${ApiConstants.updateProfile}/{id}')
  @MultiPart()
  Future<UserResponse> updateProfile(
      @Path("id") String id,
      @Part(name: "FullName") String fullName,
      @Part(name: "Username") String username,
      @Part(name: "Email") String email,
      @Part(name: "Password") String password,
      @Part(name: "Phonenumber") String phonenumber,
      @Part(name: "longitude") String longitude,
      @Part(name: "latitude") String latitude,
      @Part(name: "ImageCover") File imageCover,

      );

  @POST('${ApiConstants.confirmEmail}/{email}')
  Future<ConfirmEmailModel> confirmEmail(
      // @Header('Authorization') String token,
      @Path('email') String email,
      @Part() String emailAddress);

  @GET('${ApiConstants.confirmOtp}{otp}')
  Future<ConfirmEmailModel> confirmOtp(
      // @Header('Authorization') String token,
      @Path('otp') String otp,
      @Part() String otpp);

  @POST(ApiConstants.resetPassword)
  Future<ResetPassModel> resetPassword(
    @Part(name: "Email") String email,
    @Part(name: "NewPassword") String newPassword,
    @Part(name: "ConfirmPassword") String confirmPassword,
  );

  @GET(ApiConstants.getAllVehicle)
  Future<List<VehicleModel>> getAllVehicle(
      // @Header('Authorization') String token,
      );

  //get gold vehicles
  @GET(ApiConstants.getGoldCaravan)
  Future<List<VehicleModel>> getGoldCaravan(
      // @Header('Authorization') String token,
      );
  @GET(ApiConstants.getGoldCars)
  Future<List<VehicleModel>> getGoldCars(
      // @Header('Authorization') String token,
      );

  @GET(ApiConstants.getGoldMotorcycles)
  Future<List<VehicleModel>> getGoldMotorcycles(
      // @Header('Authorization') String token,
      );
  @GET(ApiConstants.getGoldAds)
  Future<List<VehicleModel>> getAllGoldAds(
      // @Header('Authorization') String token,
      );
  @GET(ApiConstants.getGoldTools)
  Future<List<VehicleModel>> getGoldTools(
      // @Header('Authorization') String token,
      );

  // get filter by id
  @GET("${ApiConstants.filterGetData}ads1={type1}&ads2={type2}")
  Future<List<VehicleModel>> getVehicleByFilter(
    // @Header('Authorization') String token,
    @Path('type1') String vehicleType1,
    @Path('type2') String vehicleType2,
  );

  @GET("${ApiConstants.searchProduct}{searchName}")
  Future<List<ShopItemModel>> searchProduct(
    // @Header('Authorization') String token,
    @Path('searchName') String productName,
  );

  @GET("${ApiConstants.searchAds}{searchName}")
  Future<List<VehicleModel>> searchAds(
    @Path('searchName') String vehicleOrToolName,
  );

  @GET("${ApiConstants.searchService}{searchName}")
  Future<List<SearchServiceModel>> searchService(
    @Path('searchName') String vehicleOrToolName,
  );

  @GET(ApiConstants.getGoldService)
  Future<List<ServiceModel>> getAllGoldService();

  //get news
  @GET(ApiConstants.getAllNews)
  Future<List<NewsModel>> getAllNews(
      // @Header('Authorization') String token,
      );
  @GET(ApiConstants.adminGetAllAdsPending)
  Future<List<Ad>> getllAllPending(
      // @Header('Authorization') String token,
      );

  // get all products
  @GET(ApiConstants.getAllProduct)
  Future<List<ShopItemModel>> getAllProduct(
      // @Header('Authorization') String token,
      );

  //filter by country
  @GET("${ApiConstants.filterAdsByCountry}{country}")
  Future<List<VehicleModel>> filterAdsByCountry(
    @Path('country') String country,
  );
//FilterAds/GetAllAdsType1AndCountry?ads1=Caravan&Country=%D8%A7%D9%84%D8%A3%D9%85%D8%A7%D8%B1%D8%A7%D8%AA

  //filter by country
  @GET("${ApiConstants.filterAdsByType1AndCountry}{ads1}&Country={country}")
  Future<List<VehicleModel>> filterAdsByVehicleTypeAndCountry(
    @Path('ads1') String vehicleType,
    @Path('adcountrys1') String country,
  );
//  ads1=Caravan&ads2=wanted&Country=%D8%A7%D9%84%D8%A3%D9%85%D8%A7%D8%B1%D8%A7%D8%AA

  //filter by country type 1 and 2
  @GET(
      "http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1And2AndCountry?ads1={ads1}&ads2={ads2}&Country={Country}")
  Future<List<VehicleModel>> filterAdsByVehicleType1AndType2AndCountry(
    @Path('ads1') String vehicleType,
    @Path('ads2') String type2,
    @Path('country') String country,
  );


  // @GET(
  //     "http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1And2AndCountry?ads1={ads1}&ads2={ads2}&Country={Country}")
  // Future<List<VehicleModel>> filterAdsByVehicleType1AndType2AndCity(
  //     @Path('ads1') String vehicleType,
  //     @Path('ads2') String type2,
  //     @Path('City') String city,
  //     );
///
  //http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1AndType2And3?ads1=Cars&ads2=wanted&ads3=%D9%85%D8%B3%D8%AA%D8%B9%D9%85%D9%84

    @GET(
      "http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1AndType2And3?ads1={ads1}&ads2={ads2}&ads3={ads3}"
      )
  Future<List<VehicleModel>> getVehiclesByType1And2And3(
    @Path('ads1') String vehicleType,
    @Path('ads2') String type2,
    @Path('ads3') String carCondition,
  );
  //

     @GET(
      "http://boyo33-001-site1.ktempurl.com/api/SearchInAdsAndService/SearchInAdsUsingPrice?minPrice={minPrice}&maxPrice={maxPrice}"
      )
  Future<List<VehicleModel>> getVehiclesByPrice(
    @Path('minPrice') double minPrice,
    @Path('maxPrice') double maxPrice,
  );
  @POST("${ApiConstants.addCaravan}{id}")
  @MultiPart()
  Future<VehicleModel> addCaravan(
    // @Header(ApiConstants.tokenTitle) String token,
    @Path('id') String id,
    @Part(name: "Title") String title,
    @Part(name: "Type1") String type,
    @Part(name: "Type2") String type2,
    @Part(name: "Type3") String type3,
    @Part(name: "Type4") String type4,
    @Part(name: "Image1") File image1,
    @Part(name: "Image2") File image2,
    @Part(name: "Image3") File image3,
    @Part(name: "Price") int price,
    @Part(name: "PhoneNumber") String phoneNumber,
    @Part(name: "WhatsAppNumber") String whatsAppNumber,
    @Part(name: "Description") String description,
    @Part(name: "Warranty") String warranty,
    @Part(name: "Country") String country,
    @Part(name: "City") String city,
    @Part(name: "Longitude") String longitude,
    @Part(name: "Latitude") String latitude,
    @Part(name: "AdsType") String adsType,
    @Part(name: "ColorIn") String colorIn,
    @Part(name: "ColorOut") String colorOut,
    @Part(name: "YearMake") String yearMake,
    @Part(name: "Cylinders") int cylinders,
    @Part(name: "Kilometer") int kilometer,
    @Part(name: "AddOns") String addOns,
    @Part(name: "PublicStatus") String publicStatus,
    @Part(name: "Faults") String faults,
    @Part(name: "Security") String security,
    @Part(name: "Specifications") String specifications,
    @Part(name: "Size") String size,
    @Part(name: "GeneratorType") String generatorType,
    @Part(name: "AirConditionType") String airConditionType,
    @Part(name: "AirConditionSize") String airConditionSize,
    @Part(name: "AirConditionCount") String airConditionCount,
    @Part(name: "NormalOrSaylant") String normalOrSaylant,
    @Part(name: "NumberOfParson") int numberOfParson,
    @Part(name: "Height") int height,
    @Part(name: "CreatedDate") String createdDate,
  );

  @POST("${ApiConstants.addCar}{id}")
  @MultiPart()
  Future<VehicleModel> addCar(
    @Path('id') String id,
    @Part(name: "Title") String title,
    @Part(name: "Type1") String type,
    @Part(name: "Type2") String type2,
    @Part(name: "Type3") String type3,
    @Part(name: "Type4") String type4,
    @Part(name: "Image1") File image1,
    @Part(name: "Image2") File image2,
    @Part(name: "Image3") File image3,
    @Part(name: "Price") int price,
    @Part(name: "PhoneNumber") String phoneNumber,
    @Part(name: "WhatsAppNumber") String whatsAppNumber,
    @Part(name: "Description") String description,
    @Part(name: "Warranty") String warranty,
    @Part(name: "Country") String country,
    @Part(name: "City") String city,
    @Part(name: "Longitude") String longitude,
    @Part(name: "Latitude") String latitude,
    @Part(name: "AdsType") String adsType,
    @Part(name: "ColorIn") String colorIn,
    @Part(name: "ColorOut") String colorOut,
    @Part(name: "YearMake") String yearMake,
    @Part(name: "Cylinders") int cylinders,
    @Part(name: "Kilometer") int kilometer,
    @Part(name: "AddOns") String addOns,
    @Part(name: "PublicStatus") String publicStatus,
    @Part(name: "Security") String security,
    @Part(name: "Specifications") String specifications,
    @Part(name: "CreatedDate") String createdDate,
  );

  @POST("${ApiConstants.addMotorCycles}{id}")
  @MultiPart()
  Future<VehicleModel> addMotorCycles(
    // @Header(ApiConstants.tokenTitle) String token,
    @Path('id') String id,
    @Part(name: "Title") String title,
    @Part(name: "Type1") String type,
    @Part(name: "Type2") String type2,
    @Part(name: "Type3") String type3,
    @Part(name: "Type4") String type4,
    @Part(name: "Image1") File image1,
    @Part(name: "Image2") File image2,
    @Part(name: "Image3") File image3,
    @Part(name: "Price") int price,
    @Part(name: "PhoneNumber") String phoneNumber,
    @Part(name: "WhatsAppNumber") String whatsAppNumber,
    @Part(name: "Description") String description,
    @Part(name: "Warranty") String warranty,
    @Part(name: "Country") String country,
    @Part(name: "City") String city,
    @Part(name: "Longitude") String longitude,
    @Part(name: "Latitude") String latitude,
    @Part(name: "AdsType") String adsType,
    @Part(name: "ColorOut") String colorOut,
    @Part(name: "YearMake") String yearMake,
    @Part(name: "Cylinders") int cylinders,
    @Part(name: "Kilometer") int kilometer,
    @Part(name: "AddOns") String addOns,
    @Part(name: "PublicStatus") String publicStatus,
    @Part(name: "Security") String security,
    @Part(name: "Specifications") String specifications,
    @Part(name: "CreatedDate") String createdDate,
  );

  @POST("${ApiConstants.addTools}{id}")
  @MultiPart()
  Future<VehicleModel> addTools(
    @Path('id') String id,
    @Part(name: "Title") String title,
    @Part(name: "Type1") String type,
    @Part(name: "Type2") String type2,
    @Part(name: "Type3") String type3,
    @Part(name: "Type4") String type4,
    @Part(name: "Image1") File image1,
    @Part(name: "Image2") File image2,
    @Part(name: "Image3") File image3,
    @Part(name: "Price") int price,
    @Part(name: "PhoneNumber") String phoneNumber,
    @Part(name: "WhatsAppNumber") String whatsAppNumber,
    @Part(name: "Description") String description,
    @Part(name: "Warranty") String warranty,
    @Part(name: "Country") String country,
    @Part(name: "City") String city,
    @Part(name: "Longitude") String longitude,
    @Part(name: "Latitude") String latitude,
    @Part(name: "AdsType") String adsType,
    @Part(name: "YearMake") String yearMake,
    @Part(name: "AddOns") String addOns,
    @Part(name: "PublicStatus") String publicStatus,
    @Part(name: "Security") String security,
    @Part(name: "Specifications") String specifications,
    @Part(name: "CreatedDate") String createdDate,
  );

  @GET("${ApiConstants.getService}{service}")
  Future<List<ServiceModel>> getServiceByFilter(
    @Path('service') String service,
  );

  //serv1=Washing&serv2=Out
  @GET("${ApiConstants.getServiceOutOrForHome}serv1={serv1}&serv2={serv2}")
  Future<List<ServiceModel>> getServiceOutOrForHome(
    @Path('serv1') String serv1,
    @Path('serv2') String serv2,
  );
  
  // filter by country
  @GET("http://boyo33-001-site1.ktempurl.com/api/FilterService/GetAllServiceType1AndCountry?serv1={servName}&Country={Country}")
  Future<List<ServiceModel>> getServiceByCountry(
    @Path('servName') String servName,
    @Path('Country') String country,
  );

  @GET("${ApiConstants.getWorkShopAndExhibition}serv1={serv1}&serv2={serv2}")
  Future<List<ServiceModel>> getWorkShopAndExhibition(
    @Path('serv1') String serv1,
    @Path('serv2') String serv2,
  );

  @POST("${ApiConstants.addService}{id}")
  @MultiPart()
  Future<ServiceModel> addService(
    @Path('id') String userId,
    @Part(name: "Title") String title,
    @Part(name: "Type1") String type,
    @Part(name: "Type2") String type2,
    @Part(name: "Type3") String type3,
    @Part(name: "Price") int price,
    @Part(name: "Image1") File image1,
    @Part(name: "Image2") File image2,
    @Part(name: "Image3") File image3,
    @Part(name: "PhoneNumber") String phoneNumber,
    @Part(name: "WhatsAppNumber") String whatsAppNumber,
    @Part(name: "Description") String description,
    @Part(name: "Warranty") String warranty,
    @Part(name: "Country") String country,
    @Part(name: "City") String city,
    @Part(name: "Longitude") String longitude,
    @Part(name: "Latitude") String latitude,
    @Part(name: "CountDay") int countDay,
    @Part(name: "CountPerson") int countPerson,
    @Part(name: "FromCountry") String fromCountry,
    @Part(name: "ToCountry") String toCountry,
    @Part(name: "CreatedDate") String createdDate,
  );

  @GET(ApiConstants.getAllAdsPackages)
  Future<List<PackageModel>> getAllAdsPackages();

  //http://boyo33-001-site1.ktempurl.com/api/AdsPackage/GetUserAdsPackages?userId=0a40f3af-f67b-4d13-a265-cbbff12dadd9
 @GET("${ApiConstants.getUserAdsPackages}{userId}")
  Future<List<PackageModel>> getUserAdsPackages(
    @Path('userId') String userId
  );

//http://boyo33-001-site1.ktempurl.com/api/ServicePackage/GetUserServicePackages?userId=0a40f3af-f67b-4d13-a265-cbbff12dadd9

  @GET("http://boyo33-001-site1.ktempurl.com/api/ServicePackage/GetUserServicePackages?userId={userId}")
  Future<List<ServicePackageModel>> getUserServicesPackages(
    @Path('userId') String userId
  );

  @GET(ApiConstants.getAllServicesPackages)
  Future<List<ServicePackageModel>> getAllServicesPackages();
  // user add packages
  @POST("${ApiConstants.userAdsPackage}packageId={packageId}&userId={userId}")
  Future<UserAddPackageModel> userAddPackage(
    @Path('packageId') int packageId,
    @Path('userId') String userId,
  );
  // user add service packages
  @POST(
      "${ApiConstants.userAddServicePackage}packageId={packageId}&userId={userId}")
  Future<UserAddServicePackageModel> userAddServicePackage(
    @Path('packageId') int packageId,
    @Path('userId') String userId,
  );
}
