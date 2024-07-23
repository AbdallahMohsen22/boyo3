import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/features/auth_features/domain/login_repo.dart';
import 'package:boyo3_v1/features/auth_features/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //newPassword
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    var prefs = await SharedPreferences.getInstance();
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    response.when(success: (loginResponse) {
      prefs.setBool('isAuth', true);
      prefs.setBool('isAdmin', loginResponse.isAdmin);
      prefs.setString('userId', loginResponse.id);
      prefs.setString('token', loginResponse.token);
      isSignIn = true;
      isAdmin = loginResponse.isAdmin;
      userId = loginResponse.id;
      userToken = loginResponse.token;

      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

 }




class ForgetPasswordCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  ForgetPasswordCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //newPassword
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

   void emitConfirmEmail() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.confirmEmail(
      email: emailController.text,
    );
    response.when(success: (confirmResponse) {
      emit(LoginState.success(confirmResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitConfirmOtp() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.confirmOtp(
      otp: otpController.text,
    );
    response.when(success: (confirmResponse) {
      emit(LoginState.success(confirmResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

  void emitResetPassword() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.resetPassword(
       email: emailController.text,
       newPassword: newPasswordController.text, 
       confirmPassword: confirmPasswordController.text,
      
    );
    response.when(success: (confirmResponse) {
      emit(LoginState.success(confirmResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }

}
