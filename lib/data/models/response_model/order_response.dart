class OrdersResponse {
  late String message;
  late int status;
  late List<Data> data;

  OrdersResponse({required this.message, required this.status, required this.data});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
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
  late String orderId;
  late String userName;
  late String payStatus;
  late String userMobile;
  late String userEmail;
  late String payId;
  late String totalAmount;
  late String modelId;
  late String paymentTime;
  late List<Services> services;

  Data(
      {required this.orderId,
        required this.userName,
        required this.payStatus,
        required this.userMobile,
        required this.payId,
        required this.totalAmount,
        required this.modelId,
        required this.paymentTime,
        required this.services, required this.userEmail
      });

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    userName = json['userName'];
    payStatus = json['payStatus'];
    userMobile = json['userMobile'];
    userEmail = json['userEmail'];
    payId = json['payId'];
    totalAmount = json['totalAmount'];
    modelId = json['modelId'];
    paymentTime = json['paymentTime'];
    if (json['Services'] != null) {
      services = new List<Services>.empty(growable: true);
      json['Services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['userName'] = this.userName;
    data['payStatus'] = this.payStatus;
    data['userMobile'] = this.userMobile;
    data['userEmail'] = this.userEmail;
    data['payId'] = this.payId;
    data['totalAmount'] = this.totalAmount;
    data['modelId'] = this.modelId;
    data['paymentTime'] = this.paymentTime;
    if (this.services != null) {
      data['Services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  late String sId;
  late String title;
  late String amount;

  Services({required this.sId, required this.title, required this.amount});

  Services.fromJson(Map<String, dynamic> json) {
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