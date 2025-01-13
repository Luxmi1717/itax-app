import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hl_image_picker/hl_image_picker.dart';
import 'package:itax/config/colors.dart';
import 'package:permission_handler/permission_handler.dart';

class OCRPickMediaPage extends StatefulWidget {
  const OCRPickMediaPage({super.key, this.title});

  final String? title;

  @override
  State<OCRPickMediaPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OCRPickMediaPage> {
  final _picker = HLImagePicker();
  List<HLPickerItem> _selectedImages = [];
  final bool _isCroppingEnabled = true;
  final int _count = 4;
  final MediaType _type = MediaType.all;
  final bool _enablePreview = false;
  final bool _usedCameraButton = true;
  final int _numberOfColumn = 3;
  final bool _includePrevSelected = true;
  CropAspectRatio? _aspectRatio;
  List<CropAspectRatioPreset>? _aspectRatioPresets;
  final double _compressQuality = 0.9;
  final CroppingStyle _croppingStyle = CroppingStyle.normal;

  Future<void> _requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    PermissionStatus status2 = await Permission.storage.request();

    if (status.isGranted) {
      _openCamera();
    } else {
      if (status.isDenied || status.isPermanentlyDenied) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Permission Denied'),
            content:
                const Text('Camera permission is required to take photos.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  _openPicker() async {
    try {
      final images = await _picker.openPicker(
        cropping: _isCroppingEnabled,
        selectedIds: _includePrevSelected
            ? _selectedImages.map((e) => e.id).toList()
            : null,
        pickerOptions: HLPickerOptions(
          mediaType: _type,
          enablePreview: _enablePreview,
          thumbnailCompressFormat: CompressFormat.jpg,
          thumbnailCompressQuality: 0.9,
          maxSelectedAssets: _count,
          usedCameraButton: _usedCameraButton,
          numberOfColumn: _numberOfColumn,
          isGif: true,
        ),
        cropOptions: HLCropOptions(
          aspectRatio: _aspectRatio,
          aspectRatioPresets: _aspectRatioPresets,
          compressQuality: _compressQuality,
          compressFormat: CompressFormat.jpg,
          croppingStyle: _croppingStyle,
        ),
      );
      setState(() {
        _selectedImages = images;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _openCamera() async {
    try {
      final image = await _picker.openCamera(
        cropping: _isCroppingEnabled,
        cameraOptions: const HLCameraOptions(
          cameraType: CameraType.image,
          recordVideoMaxSecond: 40,
          thumbnailCompressFormat: CompressFormat.jpg,
          thumbnailCompressQuality: 0.9,
        ),
        cropOptions: HLCropOptions(
          aspectRatio: _aspectRatio,
          aspectRatioPresets: _aspectRatioPresets,
          croppingStyle: _croppingStyle,
        ),
      );
      setState(() {
        _selectedImages = [image];
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _openCropper() async {
    try {
      if (_selectedImages.isEmpty) {
        return;
      }
      final image = await _picker.openCropper(
        _selectedImages[0].path,
        cropOptions: HLCropOptions(
          aspectRatio: _aspectRatio,
          aspectRatioPresets: _aspectRatioPresets,
          compressQuality: _compressQuality,
          compressFormat: CompressFormat.jpg,
          croppingStyle: _croppingStyle,
        ),
      );
      setState(() {
        _selectedImages = [image];
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _onOCRPressed() {
    debugPrint('OCR processing started');
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: mainBlueColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
    );
  }

  ButtonStyle _ocrButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: mainBlueColor,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: TextStyle(color: Colors.white, fontSize: 20.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: AppGradients.mainGradient,
                ),
              ),
              title: Text('OCR',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp)),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: MediaPreview(items: _selectedImages),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: _openPicker,
                        style: _buttonStyle(),
                        child: Row(
                          children: [
                            const Icon(Icons.image_search_sharp, color: Colors.white),
                            SizedBox(width: 4.w),
                            Text(
                              'Pick Images',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed: () {
                          _requestCameraPermission();
                        },
                        style: _buttonStyle(),
                        child: Row(
                          children: [
                            const Icon(Icons.photo_camera, color: Colors.white),
                            SizedBox(width: 4.w),
                            Text(
                              'Take Photo',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed:
                            _selectedImages.isNotEmpty ? _openCropper : null,
                        style: _buttonStyle(),
                        child: Row(
                          children: [
                            const Icon(Icons.crop, color: Colors.white),
                            SizedBox(width: 4.w),
                            Text(
                              'Open Cropper',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60.h),
                      ElevatedButton(
                        onPressed:
                            _selectedImages.isNotEmpty ? _onOCRPressed : null,
                        style: _ocrButtonStyle(),
                        child: Center(
                          child: Text(
                            'Extract Details from Image',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              ],
            )));
  }
}

class MediaPreview extends StatelessWidget {
  const MediaPreview({
    super.key,
    required this.items,
  });

  final List<HLPickerItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Container(
        width: 300.w,
        height: 200.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: const Text('No Image Selected'),
      );
    }

    return Container(
      width: 330.w,
      height: 230.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(items.first.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
