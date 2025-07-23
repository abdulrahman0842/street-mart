import 'package:street_mart/models/product_model.dart';
abstract class IProductService{
  Future<List<Products>?> getAllProducts();
  Future<List<Products>?> getProductByCategory(String category);

}