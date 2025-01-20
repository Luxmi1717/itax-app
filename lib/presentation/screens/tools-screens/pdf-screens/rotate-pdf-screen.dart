import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:itax/config/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color mainBlueColor = Color(0xFF004AAD);

class RotatePdfPage extends StatefulWidget {
  @override
  _RotatePdfPageState createState() => _RotatePdfPageState();
}

class _RotatePdfPageState extends State<RotatePdfPage> {
  String? _pickedPdfPath;
  bool _isBusy = false;
  int? _rotationAngle;
  List<int> _selectedPages = [];

  Future<String?> _rotatePdf(
      String filePath, List<int> pages, int angle) async {
    // Simulate rotation processing
    await Future.delayed(Duration(seconds: 2));

    // Generate a dummy file for demo purposes
    final directory = await getApplicationDocumentsDirectory();
    final newFilePath = "${directory.path}/rotated_file.pdf";

    // Replace this with actual PDF rotation logic
    final file = File(newFilePath);
    await file.writeAsBytes(await File(filePath).readAsBytes());

    return newFilePath;
  }

  Future<void> _pickPdf() async {
    try {
      setState(() {
        _isBusy = true;
      });

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _pickedPdfPath = result.files.single.path;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("PDF file selected successfully")),
        );
      }
    } catch (e) {
      log("Error picking file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking file")),
      );
    } finally {
      setState(() {
        _isBusy = false;
      });
    }
  }

  Future<void> _saveRotatedPdf(String rotatedPath) async {
    try {
      final savePath = await FilePicker.platform.saveFile(
        dialogTitle: "Save Rotated PDF",
        fileName: "rotated_file.pdf",
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (savePath != null) {
        final file = File(rotatedPath);
        await file.copy(savePath);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("File saved at: $savePath")),
        );

        OpenFile.open(savePath);
      }
    } catch (e) {
      log("Error saving file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving file")),
      );
    }
  }

  void _rotateAndSavePdf() async {
    if (_pickedPdfPath == null ||
        _rotationAngle == null ||
        _selectedPages.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a file, pages, and angle")),
      );
      return;
    }

    setState(() {
      _isBusy = true;
    });

    final rotatedPath =
        await _rotatePdf(_pickedPdfPath!, _selectedPages, _rotationAngle!);

    setState(() {
      _isBusy = false;
    });

    if (rotatedPath != null) {
      await _saveRotatedPdf(rotatedPath);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to rotate the PDF")),
      );
    }
  }

  void _selectPages(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text("Enter Page Numbers"),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "e.g., 1,2,3"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final input = controller.text;
                final pages = input
                    .split(',')
                    .map((e) => int.tryParse(e.trim()))
                    .whereType<int>()
                    .toList();
                if (pages.isNotEmpty) {
                  setState(() {
                    _selectedPages = pages;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Pages selected: ${pages.join(', ')}")),
                  );
                }
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _selectRotationAngle(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Rotation Angle"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [90, 180, 270].map((angle) {
              return RadioListTile<int>(
                title: Text("$angle°"),
                value: angle,
                groupValue: _rotationAngle,
                onChanged: (value) {
                  setState(() {
                    _rotationAngle = value;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Rotation angle selected: $angle°")),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient, 
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),),
        title:  Text('Rotate PDF', style: TextStyle(color: Colors.white, fontSize: 20.sp),),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isBusy ? null : _pickPdf,
              child: Text("Pick PDF File"),
            ),
            if (_pickedPdfPath != null) ...[
              Text(
                "Selected File: ${_pickedPdfPath!.split('/').last}",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => _selectPages(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: mainBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text("Select Pages to Rotate"),
              ),
              Text("Selected Pages: ${_selectedPages.join(', ')}"),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => _selectRotationAngle(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: mainBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text("Select Rotation Angle"),
              ),
              Text("Rotation Angle: $_rotationAngle°"),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: _isBusy ? null : _rotateAndSavePdf,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: mainBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text("Rotate and Save PDF"),
              ),
            ],
            if (_isBusy) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
