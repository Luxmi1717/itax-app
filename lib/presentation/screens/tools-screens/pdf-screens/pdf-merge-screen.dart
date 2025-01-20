import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:pdf_manipulator/pdf_manipulator.dart';
import 'package:pick_or_save/pick_or_save.dart';
import 'dart:developer';

class PdfMergerPage extends StatefulWidget {
  const PdfMergerPage({super.key});

  @override
  State<PdfMergerPage> createState() => _PdfMergerPageState();
}

class _PdfMergerPageState extends State<PdfMergerPage> {
  final PdfManipulator _pdfManipulatorPlugin = PdfManipulator();
  final PickOrSave _pickOrSavePlugin = PickOrSave();

  bool _isBusy = false;
  List<String>? _pickedFilesPaths;
  String? _mergedPDFPath;

  // Function to show snackbar
  void callSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<List<String>?> _pickFiles() async {
    try {
      setState(() {
        _isBusy = true;
      });

      final params = FilePickerParams(
        localOnly: false,
        getCachedFilePath: false,
        enableMultipleSelection: true, // Allows multiple file selection
        mimeTypesFilter: ["application/pdf"], // Filters only PDF files
        allowedExtensions: [".pdf"], // Ensures .pdf files are picked
      );

      final result = await _pickOrSavePlugin.filePicker(params: params);

      log('Picked files: $result'); // Debugging output

      setState(() {
        _isBusy = false;
      });

      if (result != null && result.isNotEmpty) {
        callSnackBar(
          context: context,
          text: "Files picked successfully.",
        );
      } else {
        callSnackBar(
          context: context,
          text: "No files selected.",
        );
      }

      return result;
    } catch (e) {
      log('Error picking files: $e');
      setState(() {
        _isBusy = false;
      });
      callSnackBar(
        context: context,
        text: "Error picking files.",
      );
      return null;
    }
  }

  Future<String?> _mergeFiles(List<String> filePaths) async {
    try {
      setState(() {
        _isBusy = true;
      });

      final params = PDFMergerParams(pdfsPaths: filePaths);
      final result = await _pdfManipulatorPlugin.mergePDFs(params: params);

      setState(() {
        _isBusy = false;
      });

      if (result != null && result.isNotEmpty) {
        callSnackBar(
          context: context,
          text: "PDFs merged successfully.",
        );
      } else {
        callSnackBar(
          context: context,
          text: "Failed to merge PDFs.",
        );
      }

      return result;
    } catch (e) {
      log(e.toString());
      setState(() {
        _isBusy = false;
      });
      callSnackBar(
        context: context,
        text: "Error merging PDFs.",
      );
      return null;
    }
  }

  Future<List<String>?> _saveFile(String filePath) async {
    try {
      setState(() {
        _isBusy = true;
      });

      final params = FileSaverParams(
        saveFiles: [
          SaveFileInfo(filePath: filePath, fileName: "Merged_PDF.pdf")
        ],
      );

      final result = await _pickOrSavePlugin.fileSaver(params: params);

      setState(() {
        _isBusy = false;
      });

      if (result != null && result.isNotEmpty) {
        callSnackBar(
          context: context,
          text: "Merged PDF saved successfully.",
        );
      } else {
        callSnackBar(
          context: context,
          text: "Failed to save merged PDF.",
        );
      }

      return result;
    } catch (e) {
      log(e.toString());
      setState(() {
        _isBusy = false;
      });
      callSnackBar(
        context: context,
        text: "Error saving file.",
      );
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppGradients.mainGradient, // Replace with your gradient
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Merge PDFs',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isBusy
                  ? null
                  : () async {
                      final pickedFiles = await _pickFiles();
                      if (pickedFiles != null && pickedFiles.isNotEmpty) {
                        setState(() {
                          _pickedFilesPaths = pickedFiles;
                        });
                      }
                    },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: mainBlueColor, // White text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text(
                  _pickedFilesPaths == null || _pickedFilesPaths!.isEmpty
                      ? 'Pick PDF Files'
                      : 'Picked ${_pickedFilesPaths!.length} Files'),
            ),
            SizedBox(height: 26.h),
            ElevatedButton(
              onPressed: _isBusy ||
                      _pickedFilesPaths == null ||
                      _pickedFilesPaths!.length < 2
                  ? null
                  : () async {
                      final mergedPath = await _mergeFiles(_pickedFilesPaths!);
                      if (mergedPath != null) {
                        setState(() {
                          _mergedPDFPath = mergedPath;
                        });
                      }
                    },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                foregroundColor: Colors.grey[800],
                backgroundColor: Colors.grey[200], // White text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text(
                  _pickedFilesPaths == null 
                      ? 'Merge PDF Files'
                      : 'Merge PDF Files'),
            ),
            SizedBox(height: 14.h),
            ElevatedButton(
                
              onPressed: () {
                _isBusy || _mergedPDFPath == null
                    ? null
                    : () async {
                        await _saveFile(_mergedPDFPath!);
                      };
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                foregroundColor: Colors.white,
                backgroundColor: mainBlueColor, // White text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: Text('Save Merged PDF'),
            ),
            SizedBox(height: 35.h),
            if (_pickedFilesPaths != null && _pickedFilesPaths!.isNotEmpty)
              Text('Picked Files: ${_pickedFilesPaths!.join(', ')}',
                  style: TextStyle(fontSize: 12.sp)),
            if (_mergedPDFPath != null)
              Text(
                'Merged PDF Path: $_mergedPDFPath',
                style: TextStyle(fontSize: 16.sp),
              ),
          ],
        ),
      ),
    );
  }
}
