import 'package:street_mart/models/location_model.dart';
import 'package:image_picker/image_picker.dart';

class NewProductModel {
  final String productName;
  final String productCategory;
  final String locationCoordinates;

  NewProductModel(
      {required this.productName,
      required this.productCategory,
      required this.locationCoordinates});

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productCategory': productCategory,
      'productLocation': locationCoordinates
    };
  }
}
