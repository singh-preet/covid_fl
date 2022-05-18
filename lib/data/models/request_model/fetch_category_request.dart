class FetchCategoryRequest {
  late String userId;
  late String appId;

  FetchCategoryRequest({required this.userId,required this.appId});

  FetchCategoryRequest.fromJson(Map<String, String> json) {
    userId = json['userId']!;
    appId = json['appId']!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['appId'] = this.appId;
    return data;
  }
}