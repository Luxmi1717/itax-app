//
//     final businessMode = businessModeFromJson(jsonString);

import 'dart:convert';

BusinessMode businessModeFromJson(String str) => BusinessMode.fromJson(json.decode(str));

String businessModeToJson(BusinessMode data) => json.encode(data.toJson());

class BusinessMode {
  bool success;
  String message;

  BusinessMode({
    required this.success,
    required this.message,
  });

  factory BusinessMode.fromJson(Map<String, dynamic> json) => BusinessMode(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
