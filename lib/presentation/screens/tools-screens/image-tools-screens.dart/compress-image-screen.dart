// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:itax/config/colors.dart';
// import 'package:path/path.dart' as p;
// import 'package:flutter_image_compress/flutter_image_compress.dart';

// class CompressImageScreen extends StatefulWidget {
//   const CompressImageScreen({super.key});

//   @override
//   State<CompressImageScreen> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<CompressImageScreen> {
//   File? _pickedImage;
//   int? _imageSize;
//   double _imageQuality = 60;

//   // Picking an image from gallery
//   Future<void> _pickImage() async {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();

//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile == null) {
//       _showSnackBar("Failed to pick image");
//       return;
//     }

//     setState(() {
//       _pickedImage = File(pickedFile.path);
//       _imageSize = _pickedImage?.lengthSync();
//     });
//   }

//   // Compressing the image
//   Future<void> _compressImage() async {
//     if (_pickedImage == null) {
//       _showSnackBar("No image is selected");
//       return;
//     }

//     ScaffoldMessenger.of(context).hideCurrentSnackBar();

//     try {
//       final String targetPath =
//           p.join(Directory.systemTemp.path, 'tempimage.jpeg');
//       final compressedImage = await FlutterImageCompress.compressAndGetFile(
//         _pickedImage!.path,
//         targetPath,
//         quality: _imageQuality.toInt(),
//       );

//       if (compressedImage == null) {
//         throw ("Failed to compress the image");
//       }

//       final result = await ImageGallerySaver.saveFile(compressedImage.path);
//       _showSnackBar("New compressed image has been saved in the Gallery.");
//     } catch (e) {
//       _showSnackBar("Compression failed: $e");
//     }
//   }

//   // Displaying a snack bar
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Handling slider value change
//   void _onImageQualityChanged(double value) {
//     setState(() {
//       _imageQuality = value;
//     });
//   }

//   // Displaying image size
//   String _getImageSizeDisplay() {
//     if (_imageSize == null) {
//       return "No image is selected yet";
//     }
//     if (_imageSize! >= 1024 * 1024) {
//       return "Size: ${(_imageSize! / (1024 * 1024)).toStringAsFixed(2)} MB";
//     }
//     return "Size: ${(_imageSize! / 1024).toStringAsFixed(2)} KB";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: AppGradients.mainGradient, // Replace with your gradient
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Merge PDFs',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(height: 50),
//             _PickedImage(image: _pickedImage),
//             const SizedBox(height: 20),
//             CustomButton(text: "Pick Image", onPressed: _pickImage),
//             const SizedBox(height: 20),
//             _ImageCapacity(imageSize: _imageSize),
//             const SizedBox(height: 20),
//             _CompressSlider(
//                 imageQuality: _imageQuality, onChanged: _onImageQualityChanged),
//             const SizedBox(height: 20),
//             CustomButton(
//                 text: "Compress",
//                 onPressed: _compressImage,
//                 color: Colors.amber),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _PickedImage extends StatelessWidget {
//   final File? image;

//   const _PickedImage({super.key, this.image});

//   @override
//   Widget build(BuildContext context) {
//     if (image == null) {
//       return Container(
//         height: 300,
//         width: 300,
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey, width: 2),
//         ),
//         child: const Icon(Icons.image, size: 100, color: Colors.grey),
//       );
//     }

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: Image.file(
//         image!,
//         fit: BoxFit.cover,
//         height: 300,
//         width: 300,
//       ),
//     );
//   }
// }

// class _ImageCapacity extends StatelessWidget {
//   final int? imageSize;

//   const _ImageCapacity({super.key, this.imageSize});

//   @override
//   Widget build(BuildContext context) {
//     String displaySize = imageSize == null
//         ? "No image is selected yet"
//         : (imageSize! >= 1024 * 1024
//             ? "Size: ${(imageSize! / (1024 * 1024)).toStringAsFixed(2)} MB"
//             : "Size: ${(imageSize! / 1024).toStringAsFixed(2)} KB");

//     return Text(
//       displaySize,
//       style: const TextStyle(color: Colors.grey, fontSize: 20),
//     );
//   }
// }

// class _CompressSlider extends StatelessWidget {
//   final double imageQuality;
//   final ValueChanged<double> onChanged;

//   const _CompressSlider(
//       {super.key, required this.imageQuality, required this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("Image Quality : ${imageQuality.toInt()}"),
//         Slider(
//           value: imageQuality,
//           min: 0,
//           max: 100,
//           divisions: 100,
//           label: "Quality : ${imageQuality.round().toString()}",
//           onChanged: onChanged,
//         ),
//       ],
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.color = Colors.blue,
//   });

//   final String text;
//   final Future<void> Function() onPressed;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8), // Rounded corners
//         ),
//         textStyle: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
