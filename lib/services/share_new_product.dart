import 'dart:convert';
import 'dart:developer';

import 'package:street_mart/models/new_product_model.dart';
import 'package:http/http.dart' as http;

class ShareNewProductService {
  String baseURL = '';
  Future<void> shareNewProduct(NewProductModel product) async {
    final url = Uri.parse(baseURL);
    final jsonData = jsonEncode(product.toJson());
    try {
      final response = await http.post(url,
          body: jsonData, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 201) {
        log('Shared');
      } else {
        log('Error unable to Share');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
