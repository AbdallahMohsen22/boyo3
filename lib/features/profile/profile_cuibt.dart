// import 'package:boyo3_v1/features/auth_features/data/models/user_response.dart';
// import 'package:boyo3_v1/features/profile/profile_states.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../core/network/api_constants.dart';
// import '../../core/widgets/shared_constants.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileInitial());
//
//   static ProfileCubit? get(context) => BlocProvider.of(context);
//
//
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController userNameController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   double? longitude;
//   double? latitude;
//   final formKey = GlobalKey<FormState>();
//
//   // UserModel? userModel;
//   // Result? result;
//
//   void updateProfile()async{
//     emit(ProfileLoadingState());
//     try {
//       var headers = {
//         ApiConstants.contentTypeTitle: ApiConstants.contentTypeBody,
//         ApiConstants.tokenTitle: ApiConstants.tokenBody
//       };
//       var data = FormData.fromMap({
//         'Email': emailController.text.trim(),
//         'Password': passwordController.text.trim(),
//         'FullName': fullNameController.text.trim(),
//         'Phonenumber': phoneNumberController.text.trim(),
//         'longitude': passwordController.text.trim(),
//         'latitude': passwordController.text.trim(),
//         'ImageCover': passwordController.text.trim(),
//       });
//
//       var dio = Dio();
//       print("API Call=====>>>> ");
//       var response = await dio.request(
//         '${ApiConstants.apiBaseUrl}${ApiConstants.updateProfile}',
//         options: Options(
//           method: 'PUT',
//           headers: headers,
//         ),
//         data: data,
//       );
//
//       if (response.statusCode == 200) {
//         print("API Response =====>>>> ${response.data}");
//         // userModel = UserResponse.fromJson(response.data);
//         // print("uId===>>${userModel!.result!.id}");
//         // print("roles===>>${userModel!.result!.roles!.first}");
//         emit(ProfileSuccessState());
//
//
//       }
//       else{
//         emit(ProfileFailedState(errorMessage:response.statusMessage! ));
//         print(response.statusCode);
//         print(response.statusMessage);
//
//       }
//
//     }
//     catch (e) {
//       if (e is DioException) {
//         if (e.response!.statusCode == 400) {
//           // Handle the 400 error explicitly
//           print('API Response=====>>>>${e.response!.data['messages']}');
//           emit(ProfileFailedState(errorMessage:e.response!.data['messages'] ));
//           Constants.showToast(msg: e.response!.data['messages'],
//               gravity: ToastGravity.BOTTOM,
//               color: Colors.red);
//         } else {
//           // Handle other errors
//           print('Error: ${e.message}');
//           Constants.showToast(msg:e.message!,
//               gravity: ToastGravity.BOTTOM,
//               color: Colors.red);
//           emit(ProfileFailedState(errorMessage:e.message!));
//         }
//       }
//       //   else {
//       //     // Handle other exceptions
//       //     print('Error: ${e.toString()}');
//       //     emit(LoginFailedState(errorMessage:e.toString()));
//       //     Constants.showToast(msg:e.toString(),
//       //         gravity: ToastGravity.BOTTOM,
//       //         color: Colors.red);
//       // }
//     }
//
//   }
//
// // void loginSubscriber()async{
// //     emit(LoginSubscriberLoadingState());
// //     try {
// //       var headers = {
// //         ApiConstants.contentTypeTitle: ApiConstants.contentTypeBody,
// //         ApiConstants.tokenTitle: ApiConstants.tokenBody
// //       };
// //       var data = FormData.fromMap({
// //         'Email': emailController.text.trim(),
// //         'Password': passwordController.text.trim()
// //       });
// //
// //       var dio = Dio();
// //       print("API Call=====>>>> ");
// //       var response = await dio.request(
// //         '${ApiConstants.apiBaseUrl}${ApiConstants.login}',
// //         options: Options(
// //           method: 'POST',
// //           headers: headers,
// //         ),
// //         data: data,
// //       );
// //
// //       if (response.statusCode == 200) {
// //         print("API Response login=====>>>> ${response.data}");
// //         userModel = UserModel.fromJson(response.data);
// //         print("uId===>>${userModel!.result!.id}");
// //         print("roles===>>${userModel!.result!.roles}");
// //         CacheHelper.saveData(key: "uId", value: userModel!.result!.id);
// //         uId = CacheHelper.getData(key: "uId");
// //         Constants.showToast(msg: "Login Success",
// //             gravity: ToastGravity.BOTTOM,
// //             color: Colors.green);
// //         emit(LoginSubscriberSuccessState());
// //
// //         // if (uId == userModel!.result!.id) {
// //         //   CacheHelper.saveData(key: "uId", value: userModel!.result!.id);
// //         //   uId = CacheHelper.getData(key: "uId");
// //         //   Constants.showToast(msg: "Login Success",
// //         //       gravity: ToastGravity.BOTTOM,
// //         //       color: Colors.green);
// //         //   emit(LoginSuccessState());
// //         //
// //         // } else {
// //         //   Constants.showToast(msg: "Not Authenticated",
// //         //       gravity: ToastGravity.BOTTOM,
// //         //       color: ColorsManager.mainBlue);
// //         // }
// //
// //       }
// //       else{
// //         emit(LoginSubscriberFailedState(errorMessage:response.statusMessage! ));
// //         print(response.statusCode);
// //         print(response.statusMessage);
// //
// //       }
// //
// //     }
// //     catch (e) {
// //       if (e is DioException) {
// //         if (e.response!.statusCode == 400) {
// //           // Handle the 400 error explicitly
// //           print('API Response=====>>>>${e.response!.data['messages']}');
// //           emit(LoginSubscriberFailedState(errorMessage:e.response!.data['messages'] ));
// //           Constants.showToast(msg: e.response!.data['messages'],
// //               gravity: ToastGravity.BOTTOM,
// //               color: Colors.red);
// //         } else {
// //           // Handle other errors
// //           print('Error: ${e.message}');
// //           Constants.showToast(msg:e.message!,
// //               gravity: ToastGravity.BOTTOM,
// //               color: Colors.red);
// //           emit(LoginSubscriberFailedState(errorMessage:e.message!));
// //         }
// //       }
// //       //   else {
// //       //     // Handle other exceptions
// //       //     print('Error: ${e.toString()}');
// //       //     emit(LoginFailedState(errorMessage:e.toString()));
// //       //     Constants.showToast(msg:e.toString(),
// //       //         gravity: ToastGravity.BOTTOM,
// //       //         color: Colors.red);
// //       // }
// //     }
// //
// //   }
//
//
//
// }
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:boyo3_v1/features/profile/profile_repo.dart';
import 'package:boyo3_v1/features/profile/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../basic_constants.dart';
import 'profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileCubit(this._profileRepository) : super(const ProfileState.initial());

  // Future<void> loadProfile() async {
  //   try {
  //     final profile = await _repository.getProfile();
  //     emit(state.copyWith(profile: profile, status: ProfileStatus.success));
  //   } catch (e) {
  //     emit(state.copyWith(status: ProfileStatus.failure));
  //   }
  // }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  double? longitude;
  double? latitude;
  File? imageCover;
  File defImage=File("/data/user/0/com.elsaleh.boyo3_v1/cache/f50f318f-7919-472f-8447-e9de58077aaa/1000096080.jpg");
  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void updateProfileState() async {
    var prefs = await SharedPreferences.getInstance();

    emit(const ProfileState.loading());
    final response = await _profileRepository.updateProfile(
      email: emailController.text,
      password: passwordController.text,
      fullName: fullNameController.text,
      username: usernameController.text,
      phonenumber: phonenumberController.text,
      longitude: longitude!.toString(),
      latitude: latitude!.toString(),
      imageCover: imageCover??defImage,
    );
    response.when(success: (profileResponse) async {
      // prefs.setBool('isAuth', true);
      // prefs.setString('userId', profileResponse.id);
      // prefs.setString('token', profileResponse.token);
      // userId = profileResponse.id;
      // userToken = profileResponse.token;
      // isSignIn = true;
      emit(ProfileState.success(profileResponse));
      print("API Response======>>>>> $response");
      print("API Response======>>>>> ${profileResponse.username}");
    }, failure: (error) {
      emit(ProfileState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}
