import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

import '../models/aadhaar_model.dart';
import '../models/invoice_model.dart';
import '../models/pan_model.dart';

class OCRRepository {
  // static const String _baseUrl = 'https://itaxeasy.com';
  // static const String _baseUrl = 'https://itaxeasy.co.in';
  //static const String _baseUrl = 'http://10.0.2.2:8080';
  static const String _baseUrl = 'http://3.111.54.160:8000';

  Future<void> requestPermission() async {
    // Request storage permission
    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Storage permission not granted');
    }
  }

  static String generateRandomId(int length) {
    final random = Random();
    const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';

    String id = '';
    for (int i = 0; i < length; i++) {
      final randomIndex = random.nextInt(characters.length);
      id += characters[randomIndex];
    }

    return id;
  }

  Future<AadhaarModel> extractAadhaarDetails(
      File image, String authToken) async {
      print(image.toString());
    print(authToken);
    print('Function started: extractAadhaarDetails');
    final url = Uri.parse('$_baseUrl/api/aadhar');
    print('API URL: $url');
    print(image.path);

    try {
      final request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          'Authorization': 'Bearer $authToken',
          'Content-Type':
              'multipart/form-data', 
        })
        ..files.add(
          await http.MultipartFile.fromPath(
            'file',
            image.path,
            
          ),
        );
        print('Request: $request');


      final response = await request.send();
      print(response);
      final responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 200) {

        final jsonMap = json.decode(responseBody);

        final aadhaarModel = AadhaarModel.fromJson(jsonMap);
        final aadhaarNumber = aadhaarModel.data?.aadhaarNumber;

        if (aadhaarNumber == null || aadhaarNumber.isEmpty) {
          throw Exception('Aadhaar number is missing in the response.');
        }

        // Save to Hive database
        final box = Hive.box<AadhaarModel>('aadhaar_models');
        await box.put(aadhaarNumber, aadhaarModel);

        return aadhaarModel;
      } else {
        final error = json.decode(responseBody);
        print('Error response: $error');
        throw Exception(
            'Failed to extract Aadhaar details. Server responded with ${response.statusCode}.');
      }
    } catch (e, stackTrace) {
      print('Exception: $e');
      print('StackTrace: $stackTrace');
      throw Exception('An error occurred while processing Aadhaar details: $e');
    }
  }

  Future<PanModel> extractPanDetails(File image, String authToken) async {
    final url = Uri.parse('$_baseUrl/api/pan');
    final request = http.MultipartRequest('POST', url);
    request.headers.addAll({'Authorization': 'Bearer $authToken'});

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.path,
        // filename: image.path.split('/').last,
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonMap = json.decode(responseBody);

      final panModel = PanModel.fromJson(jsonMap);

      final panNumber = panModel.data?.pan;

      if (panNumber == '' || panNumber == null) {
        throw Exception('Could not extract all details');
      }

      final box = Hive.box<PanModel>('pan_models');
      await box.put(panNumber, panModel);

      return panModel;
    } else {
      throw Exception('Failed to extract Pan details');
    }
  }

  Future<InvoiceModel> extractInvoiceDetails(File pdf, String authToken) async {
    final url = Uri.parse('$_baseUrl/api/invoice');
    final request = http.MultipartRequest('POST', url);
    request.headers.addAll({'Authorization': 'Bearer $authToken'});

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        pdf.path,
        filename: path.basename(pdf.path),
        contentType: MediaType('application', 'pdf'),
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonMap = json.decode(responseBody);

      final id = OCRRepository.generateRandomId(10);

      final invoiceModel = InvoiceModel.fromJson(jsonMap);

      final box = Hive.box<InvoiceModel>('invoice_models');
      await box.put(id, invoiceModel);

      return invoiceModel;
    } else {
      print(json.decode(await response.stream.bytesToString()));
      throw Exception('Failed to extract Invoice details');
    }
  }

  Future<void> deleteAadhaarModel(AadhaarModel model) async {
    final box = Hive.box<AadhaarModel>('aadhaar_models');
    await box.delete(model.data?.aadhaarNumber);
  }

  Future<void> deletePanModel(PanModel model) async {
    final box = Hive.box<PanModel>('pan_models');
    await box.delete(model.data?.pan);
  }
}
