import 'dart:convert';
import 'package:boyo3_v1/basic_constants.dart';
import 'package:boyo3_v1/core/network/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/widgets/shared_constants.dart';
import '../../allAdsForUserApproved/service_approve_model.dart';
import 'ad_model.dart';

class AdService {
  final String baseUrl;

  AdService({required this.baseUrl});
  //Service for Admin
  Future<List<Ad>> fetchPendingService() async {
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Admin/GetAllService/Pending'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${json.decode(response.body)}");

      List<dynamic> body = json.decode(response.body);
      // print("API Response List====>>>>> ${body}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ads');
    }
  }
  //Approved on servive for Admin
  Future<void> approveService(int id) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.apiBaseUrl}Admin/ApprovedOn/Service/$id'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        ApiConstants.tokenTitle: ApiConstants.tokenBody
      },

    );

    if (response.statusCode == 200) {
      Constants.showToast(msg: "Approved Success",
          gravity: ToastGravity.BOTTOM,
          color: Colors.green);
    }else {
      throw Exception('Failed to load ads');

    }
  }

  //Delete on servive for Admin
  Future<void> deleteService(int id,String userid) async {
    final response = await http.delete(
      Uri.parse('${ApiConstants.apiBaseUrl}Service/DeleteService/$id/$userid'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        ApiConstants.tokenTitle: ApiConstants.tokenBody
      },

    );

    if (response.statusCode == 200) {
      Constants.showToast(msg: "Deleted Success",
          gravity: ToastGravity.BOTTOM,
          color: Colors.green);
    }else {
      throw Exception('Failed to load service');

    }
  }
  ////One pending service for Admin
  Future<List<Ad>> fetchOnePendingService(int id) async {
    var prefs = await SharedPreferences.getInstance();
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Service/GetOneServicePending?id=$id'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${json.decode(response.body)}");


      List<dynamic> body = json.decode(response.body);
      prefs.setInt('adId',body.first);
      adId = body.first;
      print("API Response List====>>>>> ${body.first}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load service');
    }
  }


  //Ads pending for Admin
  Future<List<Ad>> fetchPendingAds() async {
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Admin/GetAllAds/Pending'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${json.decode(response.body)}");

      List<dynamic> body = json.decode(response.body);
      // print("API Response List====>>>>> ${body}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ads');
    }
  }
  ////One pending Ad for Admin
  Future<List<Ad>> fetchOnePendingAds(int id) async {
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Admin/GetOneAds/Pending?id=$id'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${json.decode(response.body)}");

      List<dynamic> body = json.decode(response.body);
      // print("API Response List====>>>>> ${body}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ads');
    }
  }

  //Approved on Ads for Admin
  Future<void> approveAd(int id) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.apiBaseUrl}Admin/ApprovedOn/Ads/$id'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        ApiConstants.tokenTitle: ApiConstants.tokenBody
      },
    );

    if (response.statusCode == 200) {
      Constants.showToast(msg: "Approved Success",
          gravity: ToastGravity.BOTTOM,
          color: Colors.green);
    }else {
      throw Exception('Failed to load ads');

    }
  }
  //Delete on Ads for Admin
  Future<void> deleteAd(int adId, String userId) async {
    final url = Uri.parse('${ApiConstants.apiBaseUrl}Ads/DeleteAds/${adId}/${userId}');
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
         ApiConstants.tokenTitle: ApiConstants.tokenBody
      },
    );

    if (response.statusCode == 200) {
      Constants.showToast(msg: "Deleted Success",
          gravity: ToastGravity.BOTTOM,
          color: Colors.green);
    }else {
      throw Exception('Failed to load ads');

    }
  }

  /////////////////////////////////////////////////////////////////////

  //Approved Ads for users
  Future<List<Ad>> fetchApprovedAdsForUser(String id) async {
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Ads/GetAllAdsForUserApproved?userId=${id}'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${json.decode(response.body)}");

      List<dynamic> body = json.decode(response.body);
      // print("API Response List====>>>>> ${body}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ads');
    }
  }

  //Approved Services for users
  Future<List<Ad>> fetchApprovedServicesForUser(String id) async {
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Service/GetAllServiceForUser?userId=$id'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${json.decode(response.body)}");

      List<dynamic> body = json.decode(response.body);
      // print("API Response List====>>>>> ${body}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

  //Pending Ads for users
  Future<List<Ad>> fetchPendingAdsForUser(String id) async {
    final response = await http.get(Uri.parse('${ApiConstants.apiBaseUrl}Ads/GetAllAdsForUserPending?userId=${id}'));

    if (response.statusCode == 200) {
      print("API Response====>>>>> ${response.statusCode}");
      print("API Response====>>>>> ${json.decode(response.body)}");

      List<dynamic> body = json.decode(response.body);
      // print("API Response List====>>>>> ${body}");
      return body.map((dynamic item) => Ad.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ads');
    }
  }
}
