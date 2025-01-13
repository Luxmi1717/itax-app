// import 'dart:typed_data';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class ImagePickerCompressSave extends StatefulWidget {
//   @override
//   _ImagePickerCompressSaveState createState() =>
//       _ImagePickerCompressSaveState();
// }

// class _ImagePickerCompressSaveState extends State<ImagePickerCompressSave> {
//   File? _imageFile;

//   // Function to pick, compress and save the image locally
//   Future<void> pickOrSave() async {
//     final ImagePicker _picker = ImagePicker();

//     // Pick an image from the gallery or camera
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile == null) return; // If no image is selected

//     File file = File(pickedFile.path);

//     // Compress the selected image
//     var compressedImage = await testCompressAndGetFile(file);

//     final directory = await getApplicationDocumentsDirectory();
//     String newPath = '${directory.path}/${basename(pickedFile.path)}';

//     await compressedImage.copy(newPath);

//     setState(() {
//       _imageFile = compressedImage;
//     });

//     print('Compressed image saved at: $newPath');
//   }

//   Future<File> testCompressAndGetFile(File file) async {
//     var result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path,
//       file.absolute.path,
//       quality: 88,
//       rotate: 180,
//     );
//     print('Original size: ${file.lengthSync()}');
//   return result!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Picker and Compress Example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: pickOrSave,
//               child: Text("Pick and Compress Image"),
//             ),
//             if (_imageFile != null)
//               Image.file(
//                 _imageFile!,
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
