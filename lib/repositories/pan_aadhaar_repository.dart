import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/user_secure_storage.dart';

class PanAadhaarRepository {
  final baseUrl = 'https://api.itaxeasy.com';




  Future<String> checkPanAadhaarStatus(String pan, String aadhaar) async {
    final url = '$baseUrl/pan/pan-aadhaar-link-status/?pan=$pan&aadhaar=$aadhaar';
    FlutterSecureStorage storage = const FlutterSecureStorage();
    final userData =  UserSecureStorage.getUser();
    String? authToken = await storage.read(key: 'user');
    print(json.decode(authToken!));

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${json.decode(authToken)['token']}',
    };
    print('SEARCHING...');

    final response = await http.get(Uri.parse(url),
    headers:headers
    );

    if (response.statusCode == 200) {
      // Return the response body
      return response.body;
    } else {
      // Return an error message if request fails
      throw Exception('Failed to load data');
    }
  }
}
