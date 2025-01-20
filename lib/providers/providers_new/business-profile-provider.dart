import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itax/new_models/aadhaar.dart';
import 'package:itax/new_models/panCard.dart';
import 'package:http/http.dart';

class BusinessProfileProvider with ChangeNotifier {
  Aadhaar _aadhaar = Aadhaar();
  PanCard _panCard = PanCard();
  String _gstinNumber = 'Not Found';
  String _bearerToken = '';

  Aadhaar get aadhaar => _aadhaar;
  PanCard get panCard => _panCard;
  String get gstinNumber => _gstinNumber;
  String get bearerToken => _bearerToken;

  // Aadhaar verification
  Future<void> verifyAadhaar(String aadhaarNumber) async {
    final url = Uri.parse(
        'https://api.itaxeasy.com/aadhaar/verify?aadhaar_number=$aadhaarNumber');
    try {
      final response = await http.get(url, headers: {
        'Authorization': _bearerToken,
      });
      if (response.statusCode == 200) {
        _aadhaar = Aadhaar.fromJson(json.decode(response.body));
      } else {
        _aadhaar = Aadhaar(
          name: 'Not Found',
          aadhaarNumber: aadhaarNumber,
          gender: 'Not Found',
          dob: 'Not Found',
        );
      }
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to verify Aadhaar: $error');
    }
  }

   // PAN-Aadhaar link verification
  Future<void> checkPanAadhaarLink(
      String panNumber, String aadhaarNumber) async {
    final url =
        Uri.parse('https://api.itaxeasy.com/pan/pan-aadhaar-link-status/');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': _bearerToken,
        },
        body: json.encode({'pan': panNumber, 'aadhaar': aadhaarNumber}),
      );
      if (response.statusCode == 200) {
        _panCard = PanCard.fromJson(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to verify PAN-Aadhaar link.');
      }
    } catch (error) {
      rethrow;
    }
  }


  // OCR Aadhaar and PAN
  Future<void> ocrAadhaarOrPan(File file,  bool ifAadhaar) async {
    final url =
    ifAadhaar ? Uri.parse('https://85734xgp-8000.inc1.devtunnels.ms/api/aadhar') : Uri.parse('https://85734xgp-8000.inc1.devtunnels.ms/api/pan');
    try {
      final request = MultipartRequest('POST', url)
        ..files.add(await MultipartFile.fromPath('file', file.path));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);
        if (ifAadhaar) {
          _aadhaar = Aadhaar.fromJson(data['data']);
        } else{
          _panCard = PanCard.fromJson(data['data']);
        }
      } else {
        throw Exception('Failed to process OCR.');
      }
      notifyListeners();
    } catch (error) {
      throw Exception('Error in OCR: $error');
    }
  }

  void saveAadhaar(Aadhaar aadhaar) {
    _aadhaar = aadhaar;
    notifyListeners();
  }

  void savePanCard(PanCard panCard) {
    _panCard = panCard;
    notifyListeners();
  }
}
