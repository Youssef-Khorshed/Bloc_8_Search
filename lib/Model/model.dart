// ignore_for_file: unnecessary_this, unnecessary_new

class AllProducts {
  dynamic statusCode;
  dynamic success;
  List<Product> data = [];
  String? message;

  AllProducts.empty();
  AllProducts.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new Product.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Product {
  String? productsTypeID;
  String? productsTypeImage;
  String? productsTypeNameArabic;
  String? productsTypeNameAbri;
  String? productsTypeNameEnglish;
  String? productsTypeNameRussian;
  String? productsTypeStatus;
  String? loadInHomePage;
  String? productsTypeDiscription;
  String? lastUpdated;
  String? createdAtProductsTyps;

  Product(
      {this.productsTypeID,
      this.productsTypeImage,
      this.productsTypeNameArabic,
      this.productsTypeNameAbri,
      this.productsTypeNameEnglish,
      this.productsTypeNameRussian,
      this.productsTypeStatus,
      this.loadInHomePage,
      this.productsTypeDiscription,
      this.lastUpdated,
      this.createdAtProductsTyps});

  Product.fromJson(Map<String, dynamic> json) {
    productsTypeID = json['ProductsTypeID'];
    productsTypeImage = json['ProductsTypeImage'];
    productsTypeNameArabic = json['ProductsTypeNameArabic'];
    productsTypeNameAbri = json['ProductsTypeNameAbri'];
    productsTypeNameEnglish = json['ProductsTypeNameEnglish'];
    productsTypeNameRussian = json['ProductsTypeNameRussian'];
    productsTypeStatus = json['ProductsTypeStatus'];
    loadInHomePage = json['LoadInHomePage'];
    productsTypeDiscription = json['ProductsTypeDiscription'];
    lastUpdated = json['lastUpdated'];
    createdAtProductsTyps = json['CreatedAtProductsTyps'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductsTypeID'] = this.productsTypeID;
    data['ProductsTypeImage'] = this.productsTypeImage;
    data['ProductsTypeNameArabic'] = this.productsTypeNameArabic;
    data['ProductsTypeNameAbri'] = this.productsTypeNameAbri;
    data['ProductsTypeNameEnglish'] = this.productsTypeNameEnglish;
    data['ProductsTypeNameRussian'] = this.productsTypeNameRussian;
    data['ProductsTypeStatus'] = this.productsTypeStatus;
    data['LoadInHomePage'] = this.loadInHomePage;
    data['ProductsTypeDiscription'] = this.productsTypeDiscription;
    data['lastUpdated'] = this.lastUpdated;
    data['CreatedAtProductsTyps'] = this.createdAtProductsTyps;
    return data;
  }
}
