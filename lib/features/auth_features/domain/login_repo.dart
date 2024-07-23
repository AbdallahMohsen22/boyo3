import 'package:boyo3_v1/core/network/api_error_handler.dart';
import 'package:boyo3_v1/core/network/api_result/api_result.dart';
import 'package:boyo3_v1/core/network/api_service/api_service.dart';
import 'package:boyo3_v1/features/auth_features/data/models/confirm_email_model.dart';
import 'package:boyo3_v1/features/auth_features/data/models/user_response.dart';
import 'package:boyo3_v1/features/home_features/data/models/resetPasswordModel/reset_pass_model.dart';




class LoginRepo{
  final ApiService apiService;
  LoginRepo (this.apiService);

  Future<ApiResult<UserResponse>> login({
    required String email ,required String password
  })async{
    try{
      var response=await apiService.login(
        // ApiConstants.tokenBody,
        email,
        password,
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


   Future<ApiResult<ConfirmEmailModel>> confirmEmail({ 
      required String email,
    })async{
   try{
      var response = await apiService.confirmEmail
      (
        // ApiConstants.tokenBody,
         email,email,
      );
       return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ConfirmEmailModel>> confirmOtp({
      required String otp,
    })async{
   try{
      var response = await apiService.confirmOtp
      (
        // ApiConstants.tokenBody,
         otp,otp,
      );
       return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ResetPassModel>> resetPassword({
      required String email,
      required String newPassword,
      required String confirmPassword,
    })async{
   try{
      var response = await apiService.resetPassword
      (
         email,newPassword,confirmPassword
      );
       return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
