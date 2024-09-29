class ProductModel {
  bool? flag;
  List<Products>? products;

  ProductModel({this.flag, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  UserId? userId;
  String? productName;
  String? productCategory;
  String? productImgURL;
  String? productLocation;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
      {this.sId,
      this.userId,
      this.productName,
      this.productCategory,
      this.productImgURL,
      this.productLocation,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    productName = json['productName'];
    productCategory = json['productCategory'];
    productImgURL = json['productImgURL'];
    productLocation = json['productLocation'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['productName'] = productName;
    data['productCategory'] = productCategory;
    data['productImgURL'] = productImgURL;
    data['productLocation'] = productLocation;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserId(
      {this.sId,
      this.name,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
