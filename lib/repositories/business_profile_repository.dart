

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itax/models/business_profile_model.dart';

class BusinessProfileRepository {
  // final baseUrl = 'https://node.itaxeasy.com';
  // final baseUrl = 'http://10.0.2.2:8080';
  final baseUrl = 'https://api.itaxeasy.com';

  BusinessProfileRepository();

  Future<BusinessProfile> fetchBusinessProfile(String bearerToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/business/profile'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json =
          jsonDecode(response.body)['data']['profile'];
      return BusinessProfile.fromJson(json);
    } else {
      throw Exception('Failed to load business profile');
    }
  }

  Future<BusinessProfile> fetchBusinessProfileFromApi(
      String bearerToken, String gstin) async {
    final response = await http.get(
      Uri.parse('$baseUrl/gst/search/gstin/$gstin'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body)['data'];
      return BusinessProfile.fromJson(json);
    } else {
      throw Exception('Failed to load business profile');
    }
  }

  Future<BusinessProfile> createOrUpdateBusinessProfile(
      String bearerToken, BusinessProfile businessProfile) async {
    final jsonBody = businessProfile.toJson();
    final response = await http.post(Uri.parse('$baseUrl/users/update-business-profile'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      },
      body:jsonBody
    );
print(response.body);
print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to create/update business profile');
    }

    final Map<String, dynamic> json = jsonDecode(response.body);
    return BusinessProfile.fromJson(json);
  }
}
