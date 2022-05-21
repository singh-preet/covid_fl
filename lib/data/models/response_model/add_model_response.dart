class AddModelResponse {
  late int modelId;
  late String message;
  late int status;

  AddModelResponse({required this.modelId, required this.message, required this.status});

  AddModelResponse.fromJson(Map<String, dynamic> json) {
    modelId = json['modelId'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelId'] = this.modelId;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}