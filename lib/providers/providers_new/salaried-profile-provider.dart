import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:itax/new_models/aadhaar.dart';
import 'package:itax/new_models/panCard.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class SalariedAadhaarPANProvider with ChangeNotifier {
  Aadhaar _aadhaar = Aadhaar();
  PanCard _panCard = PanCard();

  Aadhaar get aadhaar => _aadhaar;
  PanCard get panCard => _panCard;

  // Aadhaar verification
  Future<void> verifyAadhaar(String aadhaarNumber) async {
    final url = Uri.parse(
        'https://api.itaxeasy.com/aadhaar/verify?aadhaar_number=$aadhaarNumber');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _aadhaar = Aadhaar.fromJson(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to verify Aadhaar.');
      }
    } catch (error) {
      rethrow;
    }
  }
Future<void> ocrAadhaarOrPan(File file, bool isAadhaar) async {
    final url = Uri.parse(isAadhaar
        ? 'https://85734xgp-8000.inc1.devtunnels.ms/api/aadhar'
        : 'https://85734xgp-8000.inc1.devtunnels.ms/api/pan');

    try {
      // Print the MIME type for debugging
      final mimeType =
          lookupMimeType(file.path) ?? 'image/jpeg'; // Fallback to 'image/jpeg'
      print('File MIME type: $mimeType');
      print(basename(file.path));
      print(file.lengthSync());
      print(file.readAsBytes().asStream());
      

      var request = http.MultipartRequest("POST", url);

      // Create MultipartFile with specified content type
      var multipartFile = http.MultipartFile(
  'file',
  file.readAsBytes().asStream(),
  file.lengthSync(),
  filename: basename(file.path),
  contentType: mimeType == 'image/jpeg' ? MediaType('image', 'jpeg') : MediaType('image', 'png')

          );

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      print('Response status code: ${response.statusCode}');
      final responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');

      if (response.statusCode == 200) {
        print('The response is 200');
        final data = json.decode(responseBody);

        if (isAadhaar) {
          final extractedFields = data['extracted_fields'];
          _aadhaar = Aadhaar(
            aadhaarNumber: extractedFields['Aadhar Numbers']?.first ?? '',
            dob: extractedFields['Date of Birth']?.first ?? '',
            gender: extractedFields['Gender']?.first ?? '',
            name: extractedFields['Names']?.first ?? '',
          );
        } else {
          final panData = data['data'];
          _panCard = PanCard(
            panNumber: panData
                .firstWhere((item) => item['label'] == 'pan number',
                    orElse: () => {'text': ''})['text']
                .toString()
                .replaceAll(RegExp(r'[^\w]'), ''),
            name: panData
                .firstWhere((item) => item['label'] == 'name',
                    orElse: () => {'text': ''})['text']
                .toString()
                .replaceAll('\n', ' ')
                .trim(),
            fatherName: panData
                .firstWhere((item) => item['label'] == "father-s name",
                    orElse: () => {'text': ''})['text']
                .toString()
                .replaceAll('\n', ' ')
                .trim(),
            dob: panData
                .firstWhere((item) => item['label'] == 'dob',
                    orElse: () => {'text': ''})['text']
                .toString()
                .trim(),
          );
        }
        notifyListeners(); // Notify listeners about changes.
      } else {
        throw Exception('Failed to process OCR.');
      }
    } catch (error) {
      throw Exception('Error in OCR: $error');
    }
  }


  // Save Aadhaar Data
  void saveAadhaar(Aadhaar aadhaar) {
    _aadhaar = aadhaar;
    notifyListeners();
  }

  // Save PAN Data
  void savePanCard(PanCard panCard) {
    _panCard = panCard;
    notifyListeners();
  }

  // Clear Aadhaar Data
  void clearAadhaar() {
    _aadhaar = Aadhaar();
    notifyListeners();
  }

  // Clear PAN Data
  void clearPanCard() {
    _panCard = PanCard();
    notifyListeners();
  }
}
