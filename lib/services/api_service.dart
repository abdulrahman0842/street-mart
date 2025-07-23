import 'dart:convert';
import 'dart:developer';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  
  Future<List<Products>?> fetchProducts(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ProductModel.fromJson(json).products;
      } else {
        log('Failed to Load Data: ${response.statusCode} : ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      log("Error: Unable to Load Product $e");
      return null;
    }
  }
}
