class FetchCategoryRequest {
  late String userId;
  late String appId;
  late String categoryId;

  FetchCategoryRequest(
      {required this.userId, required this.appId, required this.categoryId});

  FetchCategoryRequest.fromJson(Map<String, String> json) {
    userId = json['userId']!;
    appId = json['appId']!;
    categoryId = json['categoryId']!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['appId'] = this.appId;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
