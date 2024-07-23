import 'dart:io';
import '../../core/network/api_error_handler.dart';
import '../../core/network/api_result/api_result.dart';
import '../../core/network/api_service/api_service.dart';
import '../auth_features/data/models/user_response.dart';


class ProfileRepository {
  final ApiService apiService;
  ProfileRepository ( this.apiService);

  // Future<Profile> getProfile() async {
  //   return await _apiService.getProfile();
  // }

  Future<ApiResult<UserResponse>> updateProfile({
    required String fullName,
    required String username,
    required String email,
    required String password,
    required String phonenumber,
    required String longitude,
    required String latitude,
    required File imageCover,
  })async{
    try{
      var response=await apiService.updateProfile(
        // ApiConstants.tokenBody,
          fullName ,
          username,
          email,
          password,
          phonenumber,
          longitude,
          latitude,
          imageCover as String,
        imageCover

      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
