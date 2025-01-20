import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../new_models/new_user_model.dart';

class UserSecureStorage {
  static const storage = FlutterSecureStorage();


  static saveGSTIN(String GSTIN) async {
    await storage.write(key: 'GSTIN', value: GSTIN);
  }

  static Future<String?> getGSTIN() async {
    String? GSTIN = await storage.read(key: 'GSTIN');
    return GSTIN;
  }
  static saveFYear(String  Fyear) async {
    await storage.write(key: 'Fyear', value: Fyear);

  }
  static Future<String?> getFYear() async {
    String?  Fyear= await storage.read(key: 'Fyear');
    return Fyear;
  }
  static savePeriod(String  period) async {
    await storage.write(key: 'period', value: period);

  }
  static Future<String?> getPeriod() async {
    String?  period= await storage.read(key: 'period');
    return period;
  }


  static saveUser(NewUserModel data, String token) async {
    await storage.write(
      key: 'user',
      value: jsonEncode(
        {
          'token': token,
          'data': data.toJSON(),
        },
      ),
    );
  }

  static Future<Map<String, dynamic>?> getUser() async {
    String? userString = await storage.read(key: 'user');

    if (userString == null) {
      return null;
    }

    Map<String, dynamic> userData = jsonDecode(userString);

    final data = jsonDecode(userData['data']);

    final user = NewUserModel(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      dob: data['dob'] ?? '',
      gender: data['gender'] ?? '',
      id: data['id'] ?? '',

      userType: data['userType'],

      pincode: data['pincode'],
      isVerified: data['isverified'],
    );

    final token = userData['token'];

    return {'user': user, 'token': token};
  }

  static removeUser() async {
    await storage.delete(key: 'user');
  }

}