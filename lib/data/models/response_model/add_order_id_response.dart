class AddOrderIdResponse {
  late Data data;
  late String message;
  late int status;

  AddOrderIdResponse(
      {required this.data, required this.message, required this.status});

  AddOrderIdResponse.fromJson(Map<String, dynamic> json) {
    data = new Data.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toJson();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  late String oderId;

  Data({required this.oderId});

  Data.fromJson(Map<String, dynamic> json) {
    oderId = json['oderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oderId'] = this.oderId;
    return data;
  }
}
