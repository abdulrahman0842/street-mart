import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:street_mart/models/product_model.dart';
import 'package:street_mart/services/config.dart';

class GetProductsServices {
  final String baseUrl = Config().baseUrl;
  List<Products>? allProducts;
  List<Products>? productsByCategory;

  Future<List<Products>?> _fetchProducts(String url) async {
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


  // Fetch all Products from the Database
  Future<void> getAllProducts() async {
    final products = await _fetchProducts('$baseUrl/products');
    if (products != null && products.isNotEmpty) {
      allProducts = products;
    } else {
      log('No Product found');
    }
  }


  // Fetch Products by Category from the Database
  Future<void> getProductByCategory(String category) async {
    final url = '$baseUrl/product/get-product-by-category/$category';
    final products = await _fetchProducts(url);
    if (products != null && products.isNotEmpty) {
      productsByCategory = products;
    } else {
      log('No product found for Category $category');
    }
  }
}
