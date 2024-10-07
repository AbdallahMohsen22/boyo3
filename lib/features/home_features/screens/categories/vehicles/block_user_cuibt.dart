
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/widgets/shared_constants.dart';
import '../../../cubit/home_cubit/home_cubit.dart';


class BlockUserCubit extends Cubit<void> {
  BlockUserCubit() : super(null);

  Future<void> blockUser(String userId, String blockedUserId) async {
    final url = 'http://boyo33-001-site1.ktempurl.com/api/BlockUser/AddBlockOnUser?userId=$userId&blockedUserId=$blockedUserId';

    try {
      final response = await http.post(Uri.parse(url));

      // Log response status code and body
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        // Handle successful blocking (e.g., show a success message)
        Constants.showToast(
            msg:"We will review the ad and block the user as soon as possible",
            color: Colors.green);
        print("User blocked successfully.");
      } else {
        // Handle failure (e.g., show an error message)
        Constants.showToast(
            msg: "You have already blocked this user's ad and it is currently being reviewed",
            color: Colors.green);
        print("Failed to block user.");
      }
    } catch (e) {
      // Handle error
      print("Error occurred while blocking user: $e");
    }
  }

  Future<void> reportUser(String userId, int adsId, String text) async {
    final url = 'http://boyo33-001-site1.ktempurl.com/api/BlockUser/AddUserReport?userId=$userId&adsId=$adsId&text=$text';

    try {
      final response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {

        Constants.showToast(
            msg:"We will review the report and the content as soon as possible",
            color: Colors.green);

        print("User reported successfully.");
      } else {

        Constants.showToast(
            msg: "You have already reported this user's ad and it is currently being reviewed",
            color: Colors.green);
        print("Failed to report user.");
      }
    } catch (e) {
      print("Error occurred while blocking user: $e");
    }
  }
}