import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf_merger/pdf_merger.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFRepository {
  Future<void> requestPermission() async {
    // Request storage permission

    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Storage permission not granted');
    }
  }

// Future<void> mergeMultiplePDF(outputDirPath, List<String> paths) async {
//     /// Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       /// Get response either success or error
//       MergeMultiplePDFResponse response = await PdfMerger.mergeMultiplePDF(
//           paths: paths, outputDirPath: outputDirPath);


//       if (response.status == "success") {
//         OpenFile.open(response.response);
//       }

//       print(response.status);
//     } on PlatformException {
//       print('Failed to get platform version.');
//     }
//   }

  
  Future<File> generateImagePdf({required List<File> imageFiles}) async {
    final pdf = pw.Document();

    // Iterate through the list of image files
    for (final imageFile in imageFiles) {
      // Read the image file as bytes
      final imageBytes = await imageFile.readAsBytes();

      // Add a page for each image
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Center(
              child: pw.Image(
                pw.MemoryImage(imageBytes),
                fit: pw.BoxFit
                    .contain, // Use `BoxFit.contain` to preserve aspect ratio
              ),
            );
          },
        ),
      );
    }

    // Save the PDF to a file
    final outputDir = await getTemporaryDirectory();
    final outputFile = File('${outputDir.path}/generated_images.pdf');
    await outputFile.writeAsBytes(await pdf.save());

    return outputFile;
  }



}




  // /// Merge PDFs locally
  // Future<File> mergePDFs(List<File> pdfs, String authToken) async {
  //   final pdf = pw.Document();

  //   for (final pdfFile in pdfs) {
  //     final bytes = await pdfFile.readAsBytes();
  //     final sourcePdf = PdfDocument();

  //     for (var i = 0; i < sourcePdf.pdfPageList.pages.length; i++) {
  //       final page = sourcePdf.pdfPageList.;

  //       final pdfPageImage = page.render(
  //         width: page.pdfDocume
  //         height: page.height,
  //         format: PdfPageImageFormat.raw,
  //       );

  //       final memoryImage = pw.MemoryImage(pdfPageImage.bytes);

  //       pdf.addPage(
  //         pw.Page(
  //           pageFormat: PdfPageFormat.a4,
  //           build: (pw.Context context) {
  //             return pw.Center(
  //               child: pw.Image(memoryImage, fit: pw.BoxFit.contain),
  //             );
  //           },
  //         ),
  //       );
  //     }
  //   }

  //   await requestPermission();

  //   const downloadsDirPath = '/storage/emulated/0/Download';
  //   final downloadsDir = Directory(downloadsDirPath);
  //   await downloadsDir.create(recursive: true);

  //   String filePath =
  //       '$downloadsDirPath/${DateTime.now().millisecondsSinceEpoch}_merged.pdf';
  //   File file = File(filePath);
  //   await file.writeAsBytes(await pdf.save());

  //   return file;
  // }
  /// Convert images to PDF locally
//   Future<File> convertImagesToPDF(List<File> images, String authToken) async {
//     final pdf = pw.Document();

//     for (final imageFile in images) {
//       final imageBytes = await imageFile.readAsBytes();
//       // final image = img.decodeImage(imageBytes)!;

//       final pdfImage = pw.MemoryImage(imageBytes);

//       pdf.addPage(
//         pw.Page(
//           pageFormat: PdfPageFormat.a4,
//           build: (pw.Context context) {
//             return pw.Center(
//               child: pw.Image(
//                 pdfImage,
//                 width: PdfPageFormat.a4.width - 20,
//                 height: PdfPageFormat.a4.height - 20,
//                 fit: pw.BoxFit.contain,
//               ),
//             );
//           },
//         ),
//       );
//     }

//     await requestPermission();

//     const downloadsDirPath = '/storage/emulated/0/Download';
//     final downloadsDir = Directory(downloadsDirPath);
//     await downloadsDir.create(recursive: true);

//     String filePath =
//         '$downloadsDirPath/${DateTime.now().millisecondsSinceEpoch}_converted.pdf';
//     File file = File(filePath);
//     await file.writeAsBytes(await pdf.save());

//     return file;
//   }
// }




// Future<File> savePdf({
//   required String name,
//   required Document pdf,
// }) async {
//   final root = Platform.isAndroid
//       ? await getExternalStorageDirectory()
//       : await getApplicationDocumentsDirectory();
//   final file = File('${root!.path}/$name');
//   await file.writeAsBytes(await pdf.save());
//   debugPrint('${root.path}/$name');
//   return file;
// }




// import 'dart:async';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:permission_handler/permission_handler.dart';

// class PDFRepository {
//   static const String _baseUrl = 'https://mom.itaxeasy.com/api';

//   Future<void> requestPermission() async {
//     // Request storage permission
//     final status = await Permission.storage.request();
//     if (status != PermissionStatus.granted) {
//       throw Exception('Storage permission not granted');
//     }
//   }

//   Future<File> mergePDFs(List<File> pdfs, String authToken) async {
//     final url = Uri.parse('$_baseUrl/merge');
//     final request = http.MultipartRequest('POST', url);
//     request.headers.addAll({'Authorization': 'Bearer $authToken'});
//     for (final pdf in pdfs) {
//       request.files.add(
//         await http.MultipartFile.fromPath(
//           'pdfs[]',
//           pdf.path,
//           filename: pdf.path.split('/').last,
//         ),
//       );
//     }

//     final response = await request.send();
//     final bytes = await response.stream.toBytes();

//     await requestPermission();

//     // final timestamp = DateTime.now().millisecondsSinceEpoch;
//     // final fileName = 'Merged_PDF_$timestamp.pdf';
//     // final dir =
//     //     (await getExternalStorageDirectories(type: StorageDirectory.documents))!
//     //         .first;
//     // final file = File('${dir.path}/$fileName');
//     // await file.writeAsBytes(bytes);
//     // return file;

//     const downloadsDirPath = '/storage/emulated/0/Download';

//     final downloadsDir = Directory(downloadsDirPath);
//     await downloadsDir.create(recursive: true);

//     String filePath =
//         '$downloadsDirPath/${DateTime.now().millisecondsSinceEpoch}.pdf';
//     File file = File(filePath);
//     await file.writeAsBytes(bytes);

//     return file;
//   }

//   Future<File> convertImagesToPDF(List<File> images, String authToken) async {
//     final url = Uri.parse('$_baseUrl/imagetopdf');
//     final request = http.MultipartRequest('POST', url);
//     request.headers.addAll({'Authorization': 'Bearer $authToken'});
//     for (final image in images) {
//       request.files.add(
//         await http.MultipartFile.fromPath(
//           'images[]',
//           image.path,
//           filename: image.path.split('/').last,
//         ),
//       );
//     }
//     final response = await request.send();
//     final bytes = await response.stream.toBytes();

//     await requestPermission();

//     // final timestamp = DateTime.now().millisecondsSinceEpoch;
//     // final fileName = 'Converted_PDF_$timestamp.pdf';
//     // final dir =
//     //     (await getExternalStorageDirectories(type: StorageDirectory.documents))!
//     //         .first;
//     // final file = File('${dir.path}/$fileName');
//     // await file.writeAsBytes(bytes);
//     const downloadsDirPath = '/storage/emulated/0/Download';

//     final downloadsDir = Directory(downloadsDirPath);
//     await downloadsDir.create(recursive: true);

//     String filePath =
//         '$downloadsDirPath/${DateTime.now().millisecondsSinceEpoch}.pdf';
//     File file = File(filePath);
//     await file.writeAsBytes(bytes);

//     return file;
//   }
// }
