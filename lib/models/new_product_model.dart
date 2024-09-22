import 'package:street_mart/models/location_model.dart';
import 'package:image_picker/image_picker.dart';

class NewProductModel {
  final String productName;
  final String productCategory;
  final XFile image;
  final Coordinates locationCoordinates;

  NewProductModel(
      {required this.productName,
      required this.productCategory,
      required this.image,
      required this.locationCoordinates});

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productCategory': productCategory,
      'image': image,
      'coordinates': locationCoordinates.toJson()
    };
  }
}
