import 'package:street_mart/models/product_model.dart';

import '../../core/interface/i_product_service.dart';
import '../../core/product_data.dart';

class MockProductService extends IProductService {
  @override
  Future<List<Products>?> getAllProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return sampleProducts;
  }

  @override
  Future<List<Products>?> getProductByCategory(String category) async {
    await Future.delayed(const Duration(seconds: 3));
    return sampleProducts;
  }
}
