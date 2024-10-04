import 'dart:convert';
import 'dart:developer';

import 'package:street_mart/models/otp_model.dart';
import 'package:street_mart/models/user_account_model.dart';
import 'package:http/http.dart' as http;
import 'package:street_mart/services/config.dart';

class UserAuthenticationService {
  String baseURL = Config().baseUrl;
  String token = '';

  Future<bool> registerUser(RegisterUserModel userData) async {
    final url = Uri.parse('$baseURL/user/register');
    final jsonData = jsonEncode(userData.toJson());

    try {
      final response = await http.post(url,
          body: jsonData, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 201) {
        log('User Registered');
        return true;
      } else {
        log('Failed to Register Used: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      log("Unable to Register User: ${e.toString()}");
      return false;
    }
  }

  Future<bool> otpVerification(OTPModel otpData) async {
    final requestBody = otpData.toJson();
    final json = jsonEncode(requestBody);
    try {
      final response = await http.post(Uri.parse('$baseURL/otp/-verify-otp'),
          body: json, headers: {'Contetnt-Type': 'application/json'});
      if (response.statusCode == 200) {
        log('OTP Verified: StatusCode ${response.statusCode}');
        return true;
      } else {
        log('Failed to verufy OTP');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }

  Future<bool> loginUser(LoginUserModel userData) async {
    final url = Uri.parse('$baseURL/user/login');
    final jsonData = jsonEncode(userData.toJson());

    try {
      final response = await http.post(url,
          body: jsonData, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        var val = jsonDecode(response.body);
        log(val["data"]["token"]);
        token = val["data"]["token"];
        log('User logged in');
        return true;
      } else {
        log(response.body);
        log('Failed');
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
