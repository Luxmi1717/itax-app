import 'dart:convert';

LoginGst loginGstFromJson(String str) => LoginGst.fromJson(json.decode(str));

String loginGstToJson(LoginGst data) => json.encode(data.toJson());

class LoginGst {
  String gstin;
  String username;

  LoginGst({
    required this.gstin,
    required this.username,
  });

  factory LoginGst.fromJson(Map<String, dynamic> json) => LoginGst(
    gstin: json["gstin"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "gstin": gstin,
    "username": username,
  };
}
