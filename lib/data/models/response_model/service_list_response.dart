class ServiceListModel {
  late String message;
  late int status;
  late List<Data> data;

  ServiceListModel({required this.message,required  this.status,required  this.data});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late int id;
  late String title;
  late String status;
  late String serviceCategory;


  Data({required this.id,required  this.title,required  this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    serviceCategory = json['serviceCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['serviceCategory'] = this.serviceCategory;
    return data;
  }
}
