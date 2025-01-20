class AadhaarModel {
  String? status;
  Data? data;

  AadhaarModel({this.status, this.data});

  AadhaarModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? yearOfBirth;
  String? gender;
  String? aadhaarNumber;
  String? name;

  Data({this.yearOfBirth, this.gender, this.aadhaarNumber, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    yearOfBirth = json['yearOfBirth'];
    gender = json['gender'];
    aadhaarNumber = json['aadhaarNumber'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['yearOfBirth'] = yearOfBirth;
    data['gender'] = gender;
    data['aadhaarNumber'] = aadhaarNumber;
    data['name'] = name;
    return data;
  }
}
