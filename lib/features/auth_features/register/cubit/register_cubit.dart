import 'dart:io';
import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/features/auth_features/domain/register_repo.dart';
import 'package:boyo3_v1/features/auth_features/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  double? longitude;
  double? latitude;
  File? imageCover;
  File defImage=File("/data/user/0/com.moharam.boyo3_v1/cache/f50f318f-7919-472f-8447-e9de58077aaa/1000096080.jpg");
  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitRegisterStates() async {
    var prefs = await SharedPreferences.getInstance();

    if (isClosed) return;

    emit(const RegisterState.loading());
    final response = await _registerRepo.register(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fullName: fullNameController.text.trim(),
      username: usernameController.text.trim(),
      phonenumber: phonenumberController.text.trim(),
      longitude: "30",
      latitude: "30",
      imageCover: imageCover??defImage,
    );
    if (isClosed) return;

    response.when(success: (registerResponse) async {
      prefs.setBool('isAuth', true);
      prefs.setBool('isAdmin', registerResponse.isAdmin);
      prefs.setString('userId', registerResponse.id);
      prefs.setString('token', registerResponse.token);
      isAdmin = registerResponse.isAdmin;
      userId = registerResponse.id;
      userToken = registerResponse.token;
      isSignIn = true;
      emit(RegisterState.success(registerResponse));
    }, failure: (error) {
      if (!isClosed) {
        emit(RegisterState.error(error: error.apiErrorModel.messages ?? ''));
      }
    });
  }
  void emitConfirmEmail() async {
    if (!isClosed) {
      emit(RegisterState.loading());
    }
    final response = await _registerRepo.confirmEmail(
      email: emailController.text,
    );
    if (!isClosed) {
      response.when(success: (confirmResponse) {
        emit(RegisterState.success(confirmResponse));
      }, failure: (error) {
        emit(RegisterState.error(error: error.apiErrorModel.messages ?? ''));
      });
    }
  }

  void emitConfirmOtp() async {
    if (isClosed) return; // Prevent state emission if the Cubit is closed

    emit(const RegisterState.loading());

    final response = await _registerRepo.confirmOtp(
      otp: otpController.text,
    );

    if (!isClosed) {
      response.when(success: (confirmResponse) {
        emit(RegisterState.success(confirmResponse));
      }, failure: (error) {
        emit(RegisterState.error(error: error.apiErrorModel.messages ?? ''));
      });
    }
  }
}
