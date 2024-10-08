class ApiConstants {
  //api constants >> http://andrewfayez-001-site1.ltempurl.com/api/
  static const String apiBaseUrl = "http://boyo33-001-site1.ktempurl.com/api/";
  static const String login = "Auth/Login";
  static const String getAllPackages = "Package/GetAllPackages";
  static const String register = "Auth/Register/User";
  static const String confirmEmail = "Email/Send Email/";
  static const String updateProfile = "Auth/UpdateSubProfile/";
  static const String confirmOtp = 'Email/Send Confirmation Email/';
  static const String getAllAdsPackages = 'AdsPackage/Admin/GetAllPackages';
  static const String getUserAdsPackages = 'AdsPackage/GetUserAdsPackages?userId=';
  static const String getAllServicesPackages =
      'ServicePackage/GetAllServicePackages';
  static const String getAllVehicle = 'Ads/GetAllAds';
  static const String apiBaseUrlForImage =
      "http://boyo33-001-site1.ktempurl.com/";

  //GetAllService/Pending
  static const String adminGetAllAdsPending = 'Admin/GetAllService/Pending';
  //ApprovedOn/Service
  static const String approvedOnService = 'Admin/ApprovedOn/Service';

  static const String filterGetData = 'FilterAds/GetAllAdsType1AndType2?';
  static const String getAllNews = 'News/GetAllNews';
  static const String getAllProduct = 'Product/GetAllProduct';
  static const String getGoldCaravan = 'FilterAdsPackage/GetAllAdsGoldCaravan';
  static const String getGoldCars = 'FilterAdsPackage/GetAllAdsGoldCar';
  static const String getGoldMotorcycles = 'FilterAdsPackage/GetAllAdsGoldMotorcycles';
  static const String getGoldAds = 'FilterAdsPackage/GetAllAdsGold';
  static const String getGoldTools = 'FilterAdsPackage/GetAllAdsGoldTools';
  static const String addCaravan = 'Ads/AddCaravanAds?userId=';
  static const String addCar = 'Ads/AddCarAds?userId=';
  static const String addMotorCycles = 'Ads/AddMotorAds?userId=';
  static const String addTools = 'Ads/AddToolsAds?userId=';
  static const String userAdsPackage = 'AdsPackage/Admin/UserAddPakage?';
  static const String searchProduct =
      "SearchAndFilter/SearchInProductUsingName?Name=";
  static const String getService = "FilterService/GetAllServiceType1?service=";
  static const String getServiceOutOrForHome =
      "FilterService/GetAllServiceType1AndType3?";
  static const String getWorkShopAndExhibition =
      "FilterService/GetAllServiceType1AndType2?";
  static const String addService = "Service/AddService?userId=";
  static const String userAddServicePackage =
      'ServicePackage/UserAddServicePakage?';

  // static const String userAdsPackage =
  //     'Ads/Admin/UserAddPakage';
  static const String searchAds =
      "SearchInAdsAndService/SearchInAdsUsingName?Name=";
  static const String searchService =
      "SearchInAdsAndService/SearchInServiceUsingName?Name=";
  static const String getGoldService = "FilterServicePackage/GetAllServiceGold";
  static const String resetPassword = 'Email/ResetPassword';
  static const String filterAdsByCountry = 'FilterAds/GetAllAdsCountry?country=';
  static const String filterAdsByType1AndCountry = 'FilterAds/GetAllAdsType1AndCountry?ads1=';
//http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1And2AndCountry?ads1=Caravan&ads2=wanted&Country=%D8%A7%D9%84%D8%A3%D9%85%D8%A7%D8%B1%D8%A7%D8%AA

  static const String filterAdsByType1AndType2AndCountry = 'FilterAds/GetAllAdsType1AndCountry?ads1=';
  static const String filterAdsByCity = 'FilterAds/GetAllAdsCity?city=';

  //vehicles constants
  static const String used = 'مستعمل';
  static const String New = 'جديد';
  static const String immediateSale = "بيع فوري";
  static const String reqular = "عادي";
  static const String immediateBuy = "شراء فوري";
  //ads
  static const String wanted = 'wanted';
  static const String forSale = 'forSale';
  static const String caravan = 'caravan';
  static const String cars = 'cars';
  static const String motorcycles = 'motorcycles';
  static const String tools = 'tools';
  static const String generators = 'generators';
  static const String noData = 'There is no data now';
  //services
  static const String camping = 'camping';
  static const String maintenance = 'maintenance';
  static const String rent = 'rent';
  static const String transfer = 'transfer';
  static const String washing = 'washing';
  static const String wasteDispol = 'wasteDispol';
  static const String waterFilling = 'waterFilling';
  static const String exhibition = 'Exhibition';
  static const String workShop = 'Workshop';
  //packages
  static const String servicePackage = 'servicePackage';
  static const String adsPackage = 'adsPackage';

  //for type3
  static const String forHome = 'forHome';
  static const String out = 'out';

  //header constants
  static const String tokenTitle = "Authorization";
  static const String tokenBody = 'Basic MTExNjU4NjU6NjAtZGF5ZnJlZXRyaWFs';
  //'Basic MTExNjU4NjU6NjAtZGF5ZnJlZXRyaWFs';
  static const String contentTypeTitle = 'content-type';
  static const String contentTypeBody = 'application/json';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

class CountryNames {
  static const String emarates = "الأمارات";
  static const String elSaudia = "السعودية";
  static const String qatar = "قطر";
  static const String elBahrin = "البحرين";
  static const String oman = "عمان";
  static const String kewait = "الكويت";
  static const String iraq = "العراق";
  // static const String wakra = "wakra";

}

