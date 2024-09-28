import 'dart:convert';
import 'dart:developer';

import 'package:street_mart/models/user_account_model.dart';
import 'package:http/http.dart' as http;
import 'package:street_mart/services/config.dart';

class UserAuthenticationService {
  String baseURL = Config().baseUrl;
  String token = '';
  Future<void> registerUser(RegisterUserModel userData) async {
    final url = Uri.parse('$baseURL/user/register');
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
  
    final url = Uri.parse('$baseURL/user/login');
    final jsonData = jsonEncode(userData.toJson());

    try {
      final response = await http.post(url,
          body: jsonData, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        var val = jsonDecode(response.body);
        log(val["data"]["token"]);
        token = val["data"]["token"];
        log(token);
        log('User logged in');
      }
      if (response.statusCode == 500) {
        log(response.body);
        log('Failed');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
