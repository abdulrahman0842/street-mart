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
