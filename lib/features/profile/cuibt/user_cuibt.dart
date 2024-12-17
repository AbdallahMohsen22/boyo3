
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';


class UserState {}

class UserInitialInfo extends UserState {}

class UserLoadingInfo extends UserState {}

class UserLoadedInfo extends UserState {
  final dynamic user;

  UserLoadedInfo(this.user);
}

class UserErrorInfo extends UserState {
  final String message;

  UserErrorInfo(this.message);
}


class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialInfo());


  void fetchUser(String userId) async {
    emit(UserLoadingInfo());
    try {
      final response = await http.get(Uri.parse('https://backend.boyo3.com/api/Auth/GetOneUser?userId=$userId'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(UserLoadedInfo(data[0])); // Assuming it's a list with one user
      } else {
        emit(UserErrorInfo('Failed to load user'));
      }
    } catch (e) {
      emit(UserErrorInfo('An error occurred'));
    }
  }
}
