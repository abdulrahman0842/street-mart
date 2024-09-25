class ProductModel {
  bool? flag;
  List<Products>? products;
  ProductModel({this.flag, this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(flag: json['flag'], products: json['products']);
  }
}

class Products {
  String? sid;
  String? productName;
  String? productCategory;
  String? productImgURL;
  String? productLocation;
  String? createdAt;
  String? updatedAt;
  int? iv;
  Products(
      {this.sid,
      this.productName,
      this.productCategory,
      this.productImgURL,
      this.productLocation,
      this.createdAt,
      this.updatedAt,
      this.iv});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        sid: json['_id'],
        productName: json['productName'],
        productCategory: json['productCategory'],
        productImgURL: json['productImgURL'],
        productLocation: json['productLocation'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        iv: json['__v']);
  }
}
