class BrandResponse {
  String? message;
  int? status;
  List<Data>? data;

  BrandResponse({required this.message, required this.status, required this.data});

  BrandResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? modelName;
  String? id;
  String? status;
  String? image;
  String? modelUrl;
  List<ServiceList>? serviceList;

  Data(
      {required this.modelName,
        required this.id,
        required this.status,
        required this.image,
        required this.modelUrl,
        required this.serviceList});

  Data.fromJson(Map<String, dynamic> json) {
    modelName = json['modelName'];
    id = json['id'];
    status = json['status'];
    image = json['image'];
    modelUrl = json['modelUrl'];
    if (json['serviceList'] != null) {
      serviceList = new List<ServiceList>.empty(growable: true);
      json['serviceList'].forEach((v) {
        serviceList!.add(new ServiceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelName'] = this.modelName;
    data['id'] = this.id;
    data['status'] = this.status;
    data['image'] = this.image;
    data['modelUrl'] = this.modelUrl;
    if (this.serviceList != null) {
      data['serviceList'] = this.serviceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceList {
  String? sId;
  String? title;
  String? amount;

  ServiceList({required this.sId,
    required this.title,
    required this.amount});

  ServiceList.fromJson(Map<String, dynamic> json) {
    sId = json['sId'];
    title = json['title'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sId'] = this.sId;
    data['title'] = this.title;
    data['amount'] = this.amount;
    return data;
  }
}
