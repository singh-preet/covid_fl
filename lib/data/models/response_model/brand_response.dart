class BrandResponse {
  late String message;
  late int status;
  late List<Data> data;

  BrandResponse({required this.message, required this.status, required this.data});

  BrandResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
      data = new List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
      data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  late String brandName;
  late String id;
  late String status;
  late String brandImage;
  late String categoryId;
  late String brandUrl;

  Data(
      {required this.brandName,
        required this.id,
        required this.status,
        required this.brandImage,
        required this.categoryId,
        required this.brandUrl});

  Data.fromJson(Map<String, dynamic> json) {
    brandName = json['brandName'];
    id = json['id'];
    status = json['status'];
    brandImage = json['brandImage'];
    categoryId = json['categoryId'];
    brandUrl = json['brandUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandName'] = this.brandName;
    data['id'] = this.id;
    data['status'] = this.status;
    data['brandImage'] = this.brandImage;
    data['categoryId'] = this.categoryId;
    data['brandUrl'] = this.brandUrl;
    return data;
  }
}
