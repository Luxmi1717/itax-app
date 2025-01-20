class PanModel {
  String? status;
  Data? data;

  PanModel({this.status, this.data});

  PanModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? fatherName;
  String? dob;
  String? pan;

  Data({this.name, this.fatherName, this.dob, this.pan});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fatherName = json['fatherName'];
    dob = json['dob'];
    pan = json['pan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['fatherName'] = fatherName;
    data['dob'] = dob;
    data['pan'] = pan;
    return data;
  }
}
