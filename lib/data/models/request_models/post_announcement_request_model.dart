class PostAnnouncementRequestModel {
  String action;
  int id;
  String message;

  PostAnnouncementRequestModel({this.action, this.id, this.message});

  PostAnnouncementRequestModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    id = json['id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['id'] = this.id;
    data['message'] = this.message;
    return data;
  }

}