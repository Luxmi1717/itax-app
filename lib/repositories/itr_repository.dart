import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
// import 'package:itaxeasy/utility/itr1_json.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:itax/config/shared/types.dart';
import 'package:itax/utility/itr1_json.dart';
import 'package:itax/utility/random_util.dart';
// import 'package:itaxeasy/utility/random_util.dart';
import 'package:path/path.dart' as path;

// import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/itr_model.dart';

class ITRRepository {
  final baseUrl = 'https://ocr.itaxeasy.com';

  ITRModel? form16Data;

  Future<File?> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final path = result.files.single.path;

      if (path == null) {
        return null;
      }

      File file = File(path);

      return file;
    } else {
      return null;
      // User canceled the picker
    }
  }

  Future<ITRModel?> uploadPDF(File pdfFile, Form16Type form16type) async {
    final url = Uri.parse('$baseUrl/ocr');

    final request = http.MultipartRequest('POST', url);

    request.fields['version'] = form16type == Form16Type.custom ? "2" : "";

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        pdfFile.path,
        filename: path.basename(pdfFile.path),
      ),
    );

    final response = await request.send();

    if (response.statusCode != 200) {
      throw http.ClientException('Something went wrong. Please try Again.');
    } else {
      final jsonString = await response.stream.bytesToString();

      final jsonResponse = jsonDecode(jsonString);

      print("Processed FORM 16");

      final itrModel = ITRModel.fromJSON(jsonResponse);

      final box = Hive.box<ITRModel>('itr_models');

      await box.put(
        generateRandomId(10),
        itrModel,
      );

      return itrModel;
    }
  }

  Future<void> requestPermission() async {
    // Request storage permission
    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Storage permission not granted');
    }
  }

  Future<void> saveJsonFile({
    required data,
    required aadhaar,
    required pan,
    required address,
    required dob,
    required fatherName,
    required bankAccountNo,
    required bankName,
    required ifscCode,
  }) async {
    if (data == null) {
      return;
    }

    await requestPermission();

    final fileName = generateItrFileName();

    final itr1Json = generateITR1Json(
      data,
      aadhaar,
      pan,
      address,
      address,
      dob,
      fatherName,
      bankAccountNo,
      bankName,
      ifscCode,
    );

    const downloadsDirPath = '/storage/emulated/0/Download';

    final downloadsDir = Directory(downloadsDirPath);

    await downloadsDir.create(recursive: true);

    // Create the file
    File jsonFile = File('$downloadsDirPath/$fileName');

    // Write the JSON data to the file
    String jsonString = jsonEncode(itr1Json);

    jsonFile.writeAsString(jsonString);
  }

  static String generateItrFileName() {
    DateTime now = DateTime.now();
    String timestamp = DateFormat('yyyyMMddHHmmss').format(now);
    return 'ITR_$timestamp.json';
  }
}
