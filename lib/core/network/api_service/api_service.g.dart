// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'http://boyo33-001-site1.ktempurl.com/api/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<UserResponse> login(
    String Email,
    String Password,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Email',
      Email,
    ));
    _data.fields.add(MapEntry(
      'Password',
      Password,
    ));
    final _options = _setStreamType<UserResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Auth/Login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponse _value;
    try {
      _value = UserResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserResponse> register(
    String fullName,
    String username,
    String email,
    String password,
    String phonenumber,
    String longitude,
    String latitude,
    File imageCover,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'FullName',
      fullName,
    ));
    _data.fields.add(MapEntry(
      'Username',
      username,
    ));
    _data.fields.add(MapEntry(
      'Email',
      email,
    ));
    _data.fields.add(MapEntry(
      'Password',
      password,
    ));
    _data.fields.add(MapEntry(
      'Phonenumber',
      phonenumber,
    ));
    _data.fields.add(MapEntry(
      'longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'latitude',
      latitude,
    ));
    _data.files.add(MapEntry(
      'ImageCover',
      MultipartFile.fromFileSync(
        imageCover.path,
        filename: imageCover.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _options = _setStreamType<UserResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Auth/Register/User',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponse _value;
    try {
      _value = UserResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserResponse> updateProfile(
    String id,
    String fullName,
    String username,
    String email,
    String password,
    String phonenumber,
    String longitude,
    String latitude,
    File imageCover,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'FullName',
      fullName,
    ));
    _data.fields.add(MapEntry(
      'Username',
      username,
    ));
    _data.fields.add(MapEntry(
      'Email',
      email,
    ));
    _data.fields.add(MapEntry(
      'Password',
      password,
    ));
    _data.fields.add(MapEntry(
      'Phonenumber',
      phonenumber,
    ));
    _data.fields.add(MapEntry(
      'longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'latitude',
      latitude,
    ));
    _data.files.add(MapEntry(
      'ImageCover',
      MultipartFile.fromFileSync(
        imageCover.path,
        filename: imageCover.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _options = _setStreamType<UserResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Auth/UpdateSubProfile//${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserResponse _value;
    try {
      _value = UserResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ConfirmEmailModel> confirmEmail(
    String email,
    String emailAddress,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'emailAddress',
      emailAddress,
    ));
    final _options = _setStreamType<ConfirmEmailModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Email/Send Email//${email}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ConfirmEmailModel _value;
    try {
      _value = ConfirmEmailModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ConfirmEmailModel> confirmOtp(
    String otp,
    String otpp,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'otpp',
      otpp,
    ));
    final _options = _setStreamType<ConfirmEmailModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Email/Send Confirmation Email/${otp}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ConfirmEmailModel _value;
    try {
      _value = ConfirmEmailModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ResetPassModel> resetPassword(
    String email,
    String newPassword,
    String confirmPassword,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Email',
      email,
    ));
    _data.fields.add(MapEntry(
      'NewPassword',
      newPassword,
    ));
    _data.fields.add(MapEntry(
      'ConfirmPassword',
      confirmPassword,
    ));
    final _options = _setStreamType<ResetPassModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Email/ResetPassword',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ResetPassModel _value;
    try {
      _value = ResetPassModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getAllVehicle() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Ads/GetAllAds',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getGoldCaravan() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAdsPackage/GetAllAdsGoldCaravan',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getGoldCars() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAdsPackage/GetAllAdsGoldCar',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getGoldMotorcycles() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAdsPackage/GetAllAdsGoldMotorcycles',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getAllGoldAds() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAdsPackage/GetAllAdsGold',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getGoldTools() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAdsPackage/GetAllAdsGoldTools',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getVehicleByFilter(
    String vehicleType1,
    String vehicleType2,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAds/GetAllAdsType1AndType2?ads1=${vehicleType1}&ads2=${vehicleType2}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ShopItemModel>> searchProduct(String productName) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ShopItemModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'SearchAndFilter/SearchInProductUsingName?Name=${productName}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ShopItemModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ShopItemModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> searchAds(String vehicleOrToolName) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'SearchInAdsAndService/SearchInAdsUsingName?Name=${vehicleOrToolName}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<SearchServiceModel>> searchService(
      String vehicleOrToolName) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<SearchServiceModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'SearchInAdsAndService/SearchInServiceUsingName?Name=${vehicleOrToolName}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<SearchServiceModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              SearchServiceModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServiceModel>> getAllGoldService() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServiceModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterServicePackage/GetAllServiceGold',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServiceModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<NewsModel>> getAllNews() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<NewsModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'News/GetAllNews',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<NewsModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => NewsModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<Ad>> getllAllPending() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<Ad>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Admin/GetAllService/Pending',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<Ad> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => Ad.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ShopItemModel>> getAllProduct() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ShopItemModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'Product/GetAllProduct',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ShopItemModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ShopItemModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> filterAdsByCountry(String country) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAds/GetAllAdsCountry?country=${country}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> filterAdsByVehicleTypeAndCountry(
    String vehicleType,
    String country,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterAds/GetAllAdsType1AndCountry?ads1=${vehicleType}&Country={country}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> filterAdsByVehicleType1AndType2AndCountry(
    String vehicleType,
    String type2,
    String country,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1And2AndCountry?ads1=${vehicleType}&ads2=${type2}&Country={Country}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getVehiclesByType1And2And3(
    String vehicleType,
    String type2,
    String carCondition,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'http://boyo33-001-site1.ktempurl.com/api/FilterAds/GetAllAdsType1AndType2And3?ads1=${vehicleType}&ads2=${type2}&ads3=${carCondition}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<VehicleModel>> getVehiclesByPrice(
    double minPrice,
    double maxPrice,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<VehicleModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'http://boyo33-001-site1.ktempurl.com/api/SearchInAdsAndService/SearchInAdsUsingPrice?minPrice=${minPrice}&maxPrice=${maxPrice}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<VehicleModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => VehicleModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<VehicleModel> addCaravan(
    String id,
    String title,
    String type,
    String type2,
    String type3,
    String type4,
    File image1,
    File image2,
    File image3,
    int price,
    String phoneNumber,
    String whatsAppNumber,
    String description,
    String warranty,
    String country,
    String city,
    String longitude,
    String latitude,
    String adsType,
    String colorIn,
    String colorOut,
    String yearMake,
    int cylinders,
    int kilometer,
    String addOns,
    String publicStatus,
    String faults,
    String security,
    String specifications,
    String size,
    String generatorType,
    String airConditionType,
    String airConditionSize,
    String airConditionCount,
    String normalOrSaylant,
    int numberOfParson,
    int height,
    String createdDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Title',
      title,
    ));
    _data.fields.add(MapEntry(
      'Type1',
      type,
    ));
    _data.fields.add(MapEntry(
      'Type2',
      type2,
    ));
    _data.fields.add(MapEntry(
      'Type3',
      type3,
    ));
    _data.fields.add(MapEntry(
      'Type4',
      type4,
    ));
    _data.files.add(MapEntry(
      'Image1',
      MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image2',
      MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image3',
      MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'Price',
      price.toString(),
    ));
    _data.fields.add(MapEntry(
      'PhoneNumber',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'WhatsAppNumber',
      whatsAppNumber,
    ));
    _data.fields.add(MapEntry(
      'Description',
      description,
    ));
    _data.fields.add(MapEntry(
      'Warranty',
      warranty,
    ));
    _data.fields.add(MapEntry(
      'Country',
      country,
    ));
    _data.fields.add(MapEntry(
      'City',
      city,
    ));
    _data.fields.add(MapEntry(
      'Longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'Latitude',
      latitude,
    ));
    _data.fields.add(MapEntry(
      'AdsType',
      adsType,
    ));
    _data.fields.add(MapEntry(
      'ColorIn',
      colorIn,
    ));
    _data.fields.add(MapEntry(
      'ColorOut',
      colorOut,
    ));
    _data.fields.add(MapEntry(
      'YearMake',
      yearMake,
    ));
    _data.fields.add(MapEntry(
      'Cylinders',
      cylinders.toString(),
    ));
    _data.fields.add(MapEntry(
      'Kilometer',
      kilometer.toString(),
    ));
    _data.fields.add(MapEntry(
      'AddOns',
      addOns,
    ));
    _data.fields.add(MapEntry(
      'PublicStatus',
      publicStatus,
    ));
    _data.fields.add(MapEntry(
      'Faults',
      faults,
    ));
    _data.fields.add(MapEntry(
      'Security',
      security,
    ));
    _data.fields.add(MapEntry(
      'Specifications',
      specifications,
    ));
    _data.fields.add(MapEntry(
      'Size',
      size,
    ));
    _data.fields.add(MapEntry(
      'GeneratorType',
      generatorType,
    ));
    _data.fields.add(MapEntry(
      'AirConditionType',
      airConditionType,
    ));
    _data.fields.add(MapEntry(
      'AirConditionSize',
      airConditionSize,
    ));
    _data.fields.add(MapEntry(
      'AirConditionCount',
      airConditionCount,
    ));
    _data.fields.add(MapEntry(
      'NormalOrSaylant',
      normalOrSaylant,
    ));
    _data.fields.add(MapEntry(
      'NumberOfParson',
      numberOfParson.toString(),
    ));
    _data.fields.add(MapEntry(
      'Height',
      height.toString(),
    ));
    _data.fields.add(MapEntry(
      'CreatedDate',
      createdDate,
    ));
    final _options = _setStreamType<VehicleModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Ads/AddCaravanAds?userId=${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleModel _value;
    try {
      _value = VehicleModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<VehicleModel> addCar(
    String id,
    String title,
    String type,
    String type2,
    String type3,
    String type4,
    File image1,
    File image2,
    File image3,
    int price,
    String phoneNumber,
    String whatsAppNumber,
    String description,
    String warranty,
    String country,
    String city,
    String longitude,
    String latitude,
    String adsType,
    String colorIn,
    String colorOut,
    String yearMake,
    int cylinders,
    int kilometer,
    String addOns,
    String publicStatus,
    String security,
    String specifications,
    String createdDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Title',
      title,
    ));
    _data.fields.add(MapEntry(
      'Type1',
      type,
    ));
    _data.fields.add(MapEntry(
      'Type2',
      type2,
    ));
    _data.fields.add(MapEntry(
      'Type3',
      type3,
    ));
    _data.fields.add(MapEntry(
      'Type4',
      type4,
    ));
    _data.files.add(MapEntry(
      'Image1',
      MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image2',
      MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image3',
      MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'Price',
      price.toString(),
    ));
    _data.fields.add(MapEntry(
      'PhoneNumber',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'WhatsAppNumber',
      whatsAppNumber,
    ));
    _data.fields.add(MapEntry(
      'Description',
      description,
    ));
    _data.fields.add(MapEntry(
      'Warranty',
      warranty,
    ));
    _data.fields.add(MapEntry(
      'Country',
      country,
    ));
    _data.fields.add(MapEntry(
      'City',
      city,
    ));
    _data.fields.add(MapEntry(
      'Longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'Latitude',
      latitude,
    ));
    _data.fields.add(MapEntry(
      'AdsType',
      adsType,
    ));
    _data.fields.add(MapEntry(
      'ColorIn',
      colorIn,
    ));
    _data.fields.add(MapEntry(
      'ColorOut',
      colorOut,
    ));
    _data.fields.add(MapEntry(
      'YearMake',
      yearMake,
    ));
    _data.fields.add(MapEntry(
      'Cylinders',
      cylinders.toString(),
    ));
    _data.fields.add(MapEntry(
      'Kilometer',
      kilometer.toString(),
    ));
    _data.fields.add(MapEntry(
      'AddOns',
      addOns,
    ));
    _data.fields.add(MapEntry(
      'PublicStatus',
      publicStatus,
    ));
    _data.fields.add(MapEntry(
      'Security',
      security,
    ));
    _data.fields.add(MapEntry(
      'Specifications',
      specifications,
    ));
    _data.fields.add(MapEntry(
      'CreatedDate',
      createdDate,
    ));
    final _options = _setStreamType<VehicleModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Ads/AddCarAds?userId=${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleModel _value;
    try {
      _value = VehicleModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<VehicleModel> addMotorCycles(
    String id,
    String title,
    String type,
    String type2,
    String type3,
    String type4,
    File image1,
    File image2,
    File image3,
    int price,
    String phoneNumber,
    String whatsAppNumber,
    String description,
    String warranty,
    String country,
    String city,
    String longitude,
    String latitude,
    String adsType,
    String colorOut,
    String yearMake,
    int cylinders,
    int kilometer,
    String addOns,
    String publicStatus,
    String security,
    String specifications,
    String createdDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Title',
      title,
    ));
    _data.fields.add(MapEntry(
      'Type1',
      type,
    ));
    _data.fields.add(MapEntry(
      'Type2',
      type2,
    ));
    _data.fields.add(MapEntry(
      'Type3',
      type3,
    ));
    _data.fields.add(MapEntry(
      'Type4',
      type4,
    ));
    _data.files.add(MapEntry(
      'Image1',
      MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image2',
      MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image3',
      MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'Price',
      price.toString(),
    ));
    _data.fields.add(MapEntry(
      'PhoneNumber',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'WhatsAppNumber',
      whatsAppNumber,
    ));
    _data.fields.add(MapEntry(
      'Description',
      description,
    ));
    _data.fields.add(MapEntry(
      'Warranty',
      warranty,
    ));
    _data.fields.add(MapEntry(
      'Country',
      country,
    ));
    _data.fields.add(MapEntry(
      'City',
      city,
    ));
    _data.fields.add(MapEntry(
      'Longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'Latitude',
      latitude,
    ));
    _data.fields.add(MapEntry(
      'AdsType',
      adsType,
    ));
    _data.fields.add(MapEntry(
      'ColorOut',
      colorOut,
    ));
    _data.fields.add(MapEntry(
      'YearMake',
      yearMake,
    ));
    _data.fields.add(MapEntry(
      'Cylinders',
      cylinders.toString(),
    ));
    _data.fields.add(MapEntry(
      'Kilometer',
      kilometer.toString(),
    ));
    _data.fields.add(MapEntry(
      'AddOns',
      addOns,
    ));
    _data.fields.add(MapEntry(
      'PublicStatus',
      publicStatus,
    ));
    _data.fields.add(MapEntry(
      'Security',
      security,
    ));
    _data.fields.add(MapEntry(
      'Specifications',
      specifications,
    ));
    _data.fields.add(MapEntry(
      'CreatedDate',
      createdDate,
    ));
    final _options = _setStreamType<VehicleModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Ads/AddMotorAds?userId=${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleModel _value;
    try {
      _value = VehicleModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<VehicleModel> addTools(
    String id,
    String title,
    String type,
    String type2,
    String type3,
    String type4,
    File image1,
    File image2,
    File image3,
    int price,
    String phoneNumber,
    String whatsAppNumber,
    String description,
    String warranty,
    String country,
    String city,
    String longitude,
    String latitude,
    String adsType,
    String yearMake,
    String addOns,
    String publicStatus,
    String security,
    String specifications,
    String createdDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Title',
      title,
    ));
    _data.fields.add(MapEntry(
      'Type1',
      type,
    ));
    _data.fields.add(MapEntry(
      'Type2',
      type2,
    ));
    _data.fields.add(MapEntry(
      'Type3',
      type3,
    ));
    _data.fields.add(MapEntry(
      'Type4',
      type4,
    ));
    _data.files.add(MapEntry(
      'Image1',
      MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image2',
      MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image3',
      MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'Price',
      price.toString(),
    ));
    _data.fields.add(MapEntry(
      'PhoneNumber',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'WhatsAppNumber',
      whatsAppNumber,
    ));
    _data.fields.add(MapEntry(
      'Description',
      description,
    ));
    _data.fields.add(MapEntry(
      'Warranty',
      warranty,
    ));
    _data.fields.add(MapEntry(
      'Country',
      country,
    ));
    _data.fields.add(MapEntry(
      'City',
      city,
    ));
    _data.fields.add(MapEntry(
      'Longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'Latitude',
      latitude,
    ));
    _data.fields.add(MapEntry(
      'AdsType',
      adsType,
    ));
    _data.fields.add(MapEntry(
      'YearMake',
      yearMake,
    ));
    _data.fields.add(MapEntry(
      'AddOns',
      addOns,
    ));
    _data.fields.add(MapEntry(
      'PublicStatus',
      publicStatus,
    ));
    _data.fields.add(MapEntry(
      'Security',
      security,
    ));
    _data.fields.add(MapEntry(
      'Specifications',
      specifications,
    ));
    _data.fields.add(MapEntry(
      'CreatedDate',
      createdDate,
    ));
    final _options = _setStreamType<VehicleModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Ads/AddToolsAds?userId=${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VehicleModel _value;
    try {
      _value = VehicleModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServiceModel>> getServiceByFilter(String service) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServiceModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterService/GetAllServiceType1?service=${service}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServiceModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServiceModel>> getServiceOutOrForHome(
    String serv1,
    String serv2,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServiceModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterService/GetAllServiceType1AndType3?serv1=${serv1}&serv2=${serv2}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServiceModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServiceModel>> getServiceByCountry(
    String servName,
    String country,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServiceModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'http://boyo33-001-site1.ktempurl.com/api/FilterService/GetAllServiceType1AndCountry?serv1=${servName}&Country=${country}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServiceModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServiceModel>> getWorkShopAndExhibition(
    String serv1,
    String serv2,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServiceModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'FilterService/GetAllServiceType1AndType2?serv1=${serv1}&serv2=${serv2}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServiceModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => ServiceModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ServiceModel> addService(
    String userId,
    String title,
    String type,
    String type2,
    String type3,
    int price,
    File image1,
    File image2,
    File image3,
    String phoneNumber,
    String whatsAppNumber,
    String description,
    String warranty,
    String country,
    String city,
    String longitude,
    String latitude,
    int countDay,
    int countPerson,
    String fromCountry,
    String toCountry,
    String createdDate,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'Title',
      title,
    ));
    _data.fields.add(MapEntry(
      'Type1',
      type,
    ));
    _data.fields.add(MapEntry(
      'Type2',
      type2,
    ));
    _data.fields.add(MapEntry(
      'Type3',
      type3,
    ));
    _data.fields.add(MapEntry(
      'Price',
      price.toString(),
    ));
    _data.files.add(MapEntry(
      'Image1',
      MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image2',
      MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.files.add(MapEntry(
      'Image3',
      MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split(Platform.pathSeparator).last,
      ),
    ));
    _data.fields.add(MapEntry(
      'PhoneNumber',
      phoneNumber,
    ));
    _data.fields.add(MapEntry(
      'WhatsAppNumber',
      whatsAppNumber,
    ));
    _data.fields.add(MapEntry(
      'Description',
      description,
    ));
    _data.fields.add(MapEntry(
      'Warranty',
      warranty,
    ));
    _data.fields.add(MapEntry(
      'Country',
      country,
    ));
    _data.fields.add(MapEntry(
      'City',
      city,
    ));
    _data.fields.add(MapEntry(
      'Longitude',
      longitude,
    ));
    _data.fields.add(MapEntry(
      'Latitude',
      latitude,
    ));
    _data.fields.add(MapEntry(
      'CountDay',
      countDay.toString(),
    ));
    _data.fields.add(MapEntry(
      'CountPerson',
      countPerson.toString(),
    ));
    _data.fields.add(MapEntry(
      'FromCountry',
      fromCountry,
    ));
    _data.fields.add(MapEntry(
      'ToCountry',
      toCountry,
    ));
    _data.fields.add(MapEntry(
      'CreatedDate',
      createdDate,
    ));
    final _options = _setStreamType<ServiceModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
        .compose(
          _dio.options,
          'Service/AddService?userId=${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ServiceModel _value;
    try {
      _value = ServiceModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<PackageModel>> getAllAdsPackages() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<PackageModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'AdsPackage/Admin/GetAllPackages',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<PackageModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => PackageModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<PackageModel>> getUserAdsPackages(String userId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<PackageModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'AdsPackage/GetUserAdsPackages?userId=${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<PackageModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => PackageModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServicePackageModel>> getUserServicesPackages(
      String userId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServicePackageModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'http://boyo33-001-site1.ktempurl.com/api/ServicePackage/GetUserServicePackages?userId=${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServicePackageModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              ServicePackageModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<ServicePackageModel>> getAllServicesPackages() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<ServicePackageModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'ServicePackage/GetAllServicePackages',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<ServicePackageModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) =>
              ServicePackageModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserAddPackageModel> userAddPackage(
    int packageId,
    String userId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserAddPackageModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'AdsPackage/Admin/UserAddPakage?packageId=${packageId}&userId=${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserAddPackageModel _value;
    try {
      _value = UserAddPackageModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<UserAddServicePackageModel> userAddServicePackage(
    int packageId,
    String userId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<UserAddServicePackageModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'ServicePackage/UserAddServicePakage?packageId=${packageId}&userId=${userId}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UserAddServicePackageModel _value;
    try {
      _value = UserAddServicePackageModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
