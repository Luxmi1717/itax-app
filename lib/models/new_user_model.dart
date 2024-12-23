import 'dart:convert';

class NewUserModel {
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String? gender = '';
  String? dob = '';
  String? password = '';
  String? aadhaar;
  String? pan;
  String? fatherName = '';
  String? address;
  String? pin = '';

  int? id = 0;

  String? userType = '';

  String? pincode;
  bool? isVerified;

  NewUserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.gender,
    this.dob,
    this.password,
    this.aadhaar,
    this.pan,
    this.fatherName,
    this.address,
    this.pin,
    this.id,
    this.userType,
    this.pincode,
    this.isVerified,
  });

  toJSON() {
    return jsonEncode({
      'email': email,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'pan': pan,
      'aadhaar': aadhaar,
      'fatherName': fatherName,
      'password': password,
      'address': address,
      'pin': pin,
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'userType': userType,
      'phone': phone,
      'pincode': pincode,
      'isverified': isVerified,
    });
  }

  update({
    String? firstName,
    String? lastName,
    String? phone,
    String? gender,
    String? address,
    String? aadhaarNumber,
    String? pan,
    String? pin,
    String? fatherName,
    String? dob,
  }) {
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.fatherName = fatherName ?? this.fatherName;
    this.pan = pan ?? this.pan;
    this.address ?? address ?? this.address;
    aadhaar = aadhaarNumber ?? aadhaar;
    this.phone = phone ?? this.phone;
    this.gender = gender ?? this.gender;
    this.pin = pin ?? this.pan;
    this.dob = dob ?? this.dob;
  }

  static fromJSON(json) {
    return NewUserModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      dob: json['dob'] ?? '',
      pan: json['pan'] ?? '',
      aadhaar: json['aadhaar'] ?? '',
      fatherName: json['fatherName'] ?? '',
      password: json['password'] ?? '',
      address: json['address'] ?? '',
      pin: json['pin'] ?? '',
      id: json['id'],
      userType: json['userType'],
      pincode: json['pincode'],
      isVerified: json['isverified'],
    );
  }
}
