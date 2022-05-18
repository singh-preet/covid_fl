class FetchBrandRequest {
  late String userId;
  late String appId;
  late String brandId;

  FetchBrandRequest({required this.userId,required this.appId, required this.brandId});

  FetchBrandRequest.fromJson(Map<String, String> json) {
    userId = json['userId']!;
    appId = json['appId']!;
    brandId = json['brandId']!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['appId'] = this.appId;
    data['brandId'] = this.brandId;
    return data;
  }
}