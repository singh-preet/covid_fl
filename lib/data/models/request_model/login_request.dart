class LoginRequest {
 late String email;
 late String password;

 LoginRequest({required this.email,required this.password});

 LoginRequest.fromJson(Map<String, String> json) {
  email = json['email']!;
  password = json['password']!;
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['email'] = this.email;
  data['password'] = this.password;
  return data;
 }
}