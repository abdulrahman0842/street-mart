import 'dart:convert';
import 'dart:developer';

import 'package:street_mart/models/new_product_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ShareNewProductService {
  String baseURL = 'http://10.0.0.18:3000/product/add';

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWJiZmNmN2JlZDhkZDcwYzdiNGUzNSIsImlhdCI6MTcyNzA3NDMyNH0.RfqEVym5khJ_hc4Nh1NM5K4FGeKzutP12Aj6hR8bmaM";
  Future<void> shareNewProduct(NewProductModel product, XFile image) async {
    final url = Uri.parse(baseURL);
    var jsonData = product.toJson();
    log(jsonData.toString());
    try {
      var request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      // request.fields['productName'] = product.productName;
      // request.fields['productCategory'] = product.productCategory;
      // request.fields['productLocation'] = product.locationCoordinates;
      request.fields['json'] = jsonEncode(jsonData);
      request.headers['token'] = token;
      var response = await request.send();
      if (response.statusCode == 400) {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
