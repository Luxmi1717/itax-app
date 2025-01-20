import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart';
import 'package:pdf_manipulator/pdf_manipulator.dart';
import 'package:pick_or_save/pick_or_save.dart';


class SplitPDFScreen extends StatefulWidget {
  const SplitPDFScreen({super.key});

  @override
  State<SplitPDFScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplitPDFScreen> {
  final _pdfManipulatorPlugin = PdfManipulator();
  final _pickOrSavePlugin = PickOrSave();

  bool _isBusy = false;
  List<String>? _splitPDFPaths;
  String? _pickedFilePathForSplit;
  int pageCount = 2;
  int byteSize = 1000000;
  List<int> pageNumbers = [2, 5, 9];
  String pageRange = "1-3,5-8";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Split PDF',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:  16.w, vertical: 20.h),
        child: ListView(
          children: [
            
            Card(
              color: Colors.grey[100],
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomButton(
                      buttonText: 'Pick single PDF file',
                      onPressed: _isBusy
                          ? null
                          : () async {
                              final params = FilePickerParams(
                                localOnly: false,
                                getCachedFilePath: false,
                                mimeTypesFilter: ["application/pdf"],
                                allowedExtensions: [".pdf"],
                              );

                              List<String>? result = await _pickFiles(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _pickedFilePathForSplit = result[0];
                                });
                              }
                            },
                    ),
                    const Divider(),
                    CustomButton(
                      buttonText: 'Split PDF by page count',
                      onPressed: _pickedFilePathForSplit == null
                          ? null
                          : () async {
                              final params = PDFSplitterParams(
                                pdfPath: _pickedFilePathForSplit!,
                                pageCount: pageCount,
                              );

                              List<String>? result = await _splitPDF(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _splitPDFPaths = result;
                                });
                              }
                              if (mounted) {
                                callSnackBar(
                                  context: context,
                                  text: result.toString(),
                                );
                              }
                            },
                    ),
                    Text(
                      "pageCount: $pageCount",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Slider(
                      value: pageCount.toDouble(),
                      min: 1,
                      max: 10,
                      divisions: 9,
                      label: "$pageCount",
                      onChanged: (double value) {
                        setState(() {
                          pageCount = value.toInt();
                        });
                      },
                    ),
                    const Divider(),
                    CustomButton(
                      buttonText: 'Split PDF by byte size',
                      onPressed: _pickedFilePathForSplit == null
                          ? null
                          : () async {
                              final params = PDFSplitterParams(
                                pdfPath: _pickedFilePathForSplit!,
                                byteSize: byteSize,
                              );

                              List<String>? result = await _splitPDF(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _splitPDFPaths = result;
                                });
                              }
                              if (mounted) {
                                callSnackBar(
                                  context: context,
                                  text: result.toString(),
                                );
                              }
                            },
                    ),
                    Text(
                      "byteSize: $byteSize",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Slider(
                      value: byteSize.toDouble(),
                      min: 100000,
                      max: 5000000,
                      divisions: 9,
                      label: "$byteSize",
                      onChanged: (double value) {
                        setState(() {
                          byteSize = value.toInt();
                        });
                      },
                    ),
                    const Divider(),
                    CustomButton(
                      buttonText: 'Split PDF by page numbers',
                      onPressed: _pickedFilePathForSplit == null
                          ? null
                          : () async {
                              final params = PDFSplitterParams(
                                pdfPath: _pickedFilePathForSplit!,
                                pageNumbers: pageNumbers,
                              );

                              List<String>? result = await _splitPDF(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _splitPDFPaths = result;
                                });
                              }
                              if (mounted) {
                                callSnackBar(
                                  context: context,
                                  text: result.toString(),
                                );
                              }
                            },
                    ),
                    Text(
                      "pageNumbers: ${pageNumbers.join(', ')}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const Divider(),
                    CustomButton(
                      buttonText: 'Split PDF by page range',
                      onPressed: _pickedFilePathForSplit == null
                          ? null
                          : () async {
                              final params = PDFSplitterParams(
                                pdfPath: _pickedFilePathForSplit!,
                                pageRange: pageRange,
                              );

                              List<String>? result = await _splitPDF(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _splitPDFPaths = result;
                                });
                              }
                              if (mounted) {
                                callSnackBar(
                                  context: context,
                                  text: result.toString(),
                                );
                              }
                            },
                    ),
                    Text(
                      "pageRange: $pageRange",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const Divider(),
                    CustomButton(
                      buttonText: 'Save split PDFs',
                      onPressed: _splitPDFPaths == null
                          ? null
                          : _isBusy
                              ? null
                              : () async {
                                  final params = FileSaverParams(
                                    saveFiles: List.generate(
                                      _splitPDFPaths!.length,
                                      (index) => SaveFileInfo(
                                          filePath: _splitPDFPaths![index],
                                          fileName:
                                              "Split PDF ${index + 1}.pdf"),
                                    ),
                                  );

                                  List<String>? result =
                                      await _saveFile(params);

                                  if (mounted) {
                                    callSnackBar(
                                      context: context,
                                      text: result.toString(),
                                    );
                                  }
                                },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<String>?> _splitPDF(PDFSplitterParams params) async {
    List<String>? result;
    try {
      result = await _pdfManipulatorPlugin.splitPDF(params: params);
    } on PlatformException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  Future<List<String>?> _pickFiles(FilePickerParams params) async {
    try {
      setState(() {
        _isBusy = true;
      });

      final result = await _pickOrSavePlugin.filePicker(params: params);

      log('Picked files: $result');

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

  Future<List<String>?> _saveFile(FileSaverParams params) async {
    try {
      setState(() {
        _isBusy = true;
      });

      final result = await _pickOrSavePlugin.fileSaver(params: params);

      setState(() {
        _isBusy = false;
      });

      if (result != null && result.isNotEmpty) {
        callSnackBar(
          context: context,
          text: "Files saved successfully.",
        );
      } else {
        callSnackBar(
          context: context,
          text: "Failed to save files.",
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
        text: "Error saving files.",
      );
      return null;
    }
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const CustomButton(
      {required this.buttonText, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // White text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
      child: Text(buttonText),
    );
  }
}

void callSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
