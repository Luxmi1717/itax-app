import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itax/config/colors.dart'; // Replace with your actual colors.dart
import 'package:itax/presentation/widgets/blue_button.dart';
import 'package:pdf_manipulator/pdf_manipulator.dart';
import 'package:pick_or_save/pick_or_save.dart';

class CompressPdfScreen extends StatefulWidget {
  const CompressPdfScreen({Key? key}) : super(key: key);

  @override
  State<CompressPdfScreen> createState() => _CompressPdfScreenState();
}

class _CompressPdfScreenState extends State<CompressPdfScreen> {
  final _pdfManipulatorPlugin = PdfManipulator();
  final _pickOrSavePlugin = PickOrSave();

  String? _pickedFilePathForCompressingPDF;
  String? _compressedPDFPath;
  int imageQuality = 70;
  double imageScale = 0.5;
  bool _isBusy = false;

  /// Compress the selected PDF
  Future<String?> _pdfCompressor(PDFCompressorParams params) async {
    String? result;
    try {
      result = await _pdfManipulatorPlugin.pdfCompressor(params: params);
    } on PlatformException catch (e) {
      print('Error compressing PDF: $e');
    } catch (e) {
      print('Unexpected error: $e');
    }
    return result;
  }

  /// Pick a PDF file
  Future<List<String>?> _filePicker(FilePickerParams params) async {
    List<String>? result;
    try {
      setState(() {
        _isBusy = true;
      });
      result = await _pickOrSavePlugin.filePicker(params: params);
    } on PlatformException catch (e) {
      print('Error picking file: $e');
    } catch (e) {
      print('Unexpected error: $e');
    }
    setState(() {
      _isBusy = false;
    });
    return result;
  }

  /// Save the compressed PDF to local storage
  Future<List<String>?> _fileSaver(FileSaverParams params) async {
    List<String>? result;
    try {
      setState(() {
        _isBusy = true;
      });
      result = await _pickOrSavePlugin.fileSaver(params: params);
    } on PlatformException catch (e) {
      print('Error saving file: $e');
    } catch (e) {
      print('Unexpected error: $e');
    }
    setState(() {
      _isBusy = false;
    });
    return result;
  }

  /// Show a snack bar
  void callSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
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
          'Compress PDF',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _pickedFilePathForCompressingPDF == null
                                ? const Color.fromARGB(255, 191, 191, 191)
                                : mainBlueColor,
                      ),
                      onPressed: _isBusy
                          ? null
                          : () async {
                              final params = FilePickerParams(
                                localOnly: true,
                                mimeTypesFilter: ["application/pdf"],
                                allowedExtensions: [".pdf"],
                              );

                              List<String>? result = await _filePicker(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _pickedFilePathForCompressingPDF = result[0];
                                });
                                callSnackBar(
                                  context: context,
                                  text: "File picked successfully.",
                                );
                              } else {
                                callSnackBar(
                                  context: context,
                                  text: "No file selected.",
                                );
                              }
                            },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.upload_file),
                          Text(
                            'Pick Single PDF File',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Image Quality:'),
                        Text('$imageQuality'),
                      ],
                    ),
                    Slider(
                      value: imageQuality.toDouble(),
                      min: 10,
                      max: 100,
                      divisions: 19,
                      label: '$imageQuality',
                      onChanged: _isBusy
                          ? null
                          : (value) {
                              setState(() {
                                imageQuality = value.toInt();
                              });
                            },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Image Scale:'),
                        Text('${(imageScale * 100).toStringAsFixed(0)}%'),
                      ],
                    ),
                    Slider(
                      value: imageScale,
                      min: 0.1,
                      max: 1.0,
                      divisions: 9,
                      label: '${(imageScale * 100).toStringAsFixed(0)}%',
                      onChanged: _isBusy
                          ? null
                          : (value) {
                              setState(() {
                                imageScale = value;
                              });
                            },
                    ),
                    BlueButton(
                      onPressed: _pickedFilePathForCompressingPDF == null
                          ? () {
                              callSnackBar(
                                context: context,
                                text: "Please select a PDF file to compress.",
                              );
                            }
                          : () async {
                              final params = PDFCompressorParams(
                                pdfPath: _pickedFilePathForCompressingPDF!,
                                imageQuality: imageQuality,
                                imageScale: imageScale,
                              );

                              String? result = await _pdfCompressor(params);

                              if (result != null && result.isNotEmpty) {
                                setState(() {
                                  _compressedPDFPath = result;
                                });
                                callSnackBar(
                                  context: context,
                                  text: "PDF compressed successfully.",
                                );
                              } else {
                                callSnackBar(
                                  context: context,
                                  text: "PDF compression failed.",
                                );
                              }
                            },
                      title: 'Compress PDF',
                    ),
                    const SizedBox(height: 8),
                    BlueButton(
                      onPressed: _compressedPDFPath == null
                          ? () {
                              callSnackBar(
                                context: context,
                                text: "No compressed PDF to save.",
                              );
                            }
                          : () async {
                              final params = FileSaverParams(
                                localOnly: true,
                                saveFiles: [
                                  SaveFileInfo(
                                    filePath: _compressedPDFPath!,
                                    fileName: "Compressed PDF.pdf",
                                  ),
                                ],
                              );

                              List<String>? result = await _fileSaver(params);

                              if (result != null && result.isNotEmpty) {
                                callSnackBar(
                                  context: context,
                                  text: "Compressed PDF saved successfully.",
                                );
                              } else {
                                callSnackBar(
                                  context: context,
                                  text: "Failed to save compressed PDF.",
                                );
                              }
                            },
                      title: 'Save Compressed PDF',
                    ),
                  ],
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
