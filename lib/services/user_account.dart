import 'dart:convert';
import 'dart:developer';

import 'package:street_mart/models/user_account_model.dart';
import 'package:http/http.dart' as http;

class UserAuthenticationService {
  String baseURL = '';
  Future<void> registerUser(RegisterUserModel userData) async {
    final url = Uri.parse(baseURL);
    final jsonData = jsonEncode(userData.toJson());

    try {
      final response = await http.post(url,
          body: jsonData, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 201) {
        log('User Registered');
      }
      if (response.statusCode == 400) {
        log('Failed');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loginUser(LoginUserModel userData) async {
    final url = Uri.parse(baseURL);
    final jsonData = jsonEncode(userData.toJson());
    try {
      final response = await http.post(url,
          body: jsonData, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 201) {
        log('User logged in');
      }
      if (response.statusCode == 400) {
        log('Failed');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
