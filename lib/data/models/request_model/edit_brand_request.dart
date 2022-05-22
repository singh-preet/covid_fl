class EditBrandRequest {
  late String userId;
  late String appId;
  late String brandId;
  late String brandName;
  late String image;

  EditBrandRequest(
      {required this.userId,
      required this.appId,
      required this.brandId,
      required this.brandName,
      required this.image});

  EditBrandRequest.fromJson(Map<String, String> json) {
    userId = json['userId']!;
    appId = json['appId']!;
    brandId = json['brandId']!;
    brandName = json['brandName']!;
    image = json['image']!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['appId'] = this.appId;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['image'] = this.image;
    return data;
  }
}
