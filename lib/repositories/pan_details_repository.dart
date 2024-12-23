import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pan_details_model.dart';

class PanDetailsRepository {
  final baseUrl = 'https://api.itaxeasy.com';

  Future<PanDetails> getPanDetails(String token, String pan) async {
    final url = '$baseUrl/pan/get-pan-details?pan=$pan';

    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return PanDetails.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
