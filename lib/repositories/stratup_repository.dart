import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/startup/get_stratup.dart';
import 'package:http/http.dart' as http;

class StartupRepository {
  final baseUrl = 'https://api.itaxeasy.com';

  Future<AllStratupModel> getStartupDetails(String token) async {
    const url = 'https://api.itaxeasy.com/services';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return AllStratupModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}