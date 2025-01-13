// import 'dart:io';

// import 'package:flutter_share/flutter_share.dart';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:itax/config/colors.dart';
// import 'package:itax/cubits/auth_cubit.dart';
// import 'package:itax/cubits/pdf_cubit.dart';
// import 'package:itax/cubits/pdf_state.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:path_provider/path_provider.dart';
// // import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class MergePDFScreen extends StatefulWidget {
//   const MergePDFScreen({super.key});

//   @override
//   State<MergePDFScreen> createState() => _MergePDFScreenState();
// }

// class _MergePDFScreenState extends State<MergePDFScreen> {
//   final List<File> _files = [];
//   late final String? token;

//   File? pdf;

//   @override
//   initState() {
//     super.initState();

//     token = BlocProvider.of<AuthCubit>(context, listen: false)
//         .getprintgedInUser()
//         .token;
//   }

//   _handleSelectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       setState(() {
//         _files.addAll(result.paths.map((e) => File(e!)).toList());
//       });
//     } else {
//       // User canceled the picker
//     }
//   }

//   _handleDelete(index) {
//     final file = _files[index];

//     setState(() {
//       _files.remove(file);
//     });
//   }

//   _handleMerge() async {
//     final root = Platform.isAndroid
//         ? await getExternalStorageDirectory()
//         : await getApplicationDocumentsDirectory();
//     if (token != null) {
//       BlocProvider.of<PDFCubit>(context, listen: false)
//           .mergePDF(files: _files, savePath: '${root!.path}/merged.pdf');
//     }
//   }

//   _handleShare() async {
//     try {
//       await FlutterShare.shareFile(title: 'Merged PDF', filePath: pdf!.path);

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('PDF shared')),
//         );
//       }
//     } catch (e) {
//       print(e);
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Could not share file'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     final width = size.width;
//     final height = size.height;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         appBar: AppBar(
//             leading: Icon(Icons.arrow_back_ios, color: whiteColor,),
//             backgroundColor: Theme.of(context).colorScheme.surface,
//             centerTitle: true,
//             elevation: 0,
//             title: const Text(
//               'Merge PDFs',
//               // style: Theme.of(context).textTheme.titleLarge,
//             ),
//             actions: [
//               if (_files.isNotEmpty && pdf == null)
//                 TextButton(
//                   onPressed: _handleMerge,
//                   child: const Text('Merge'),
//                 ),
//               if (pdf != null)
//                 IconButton(
//                   onPressed: _handleShare,
//                   icon: Icon(
//                     Icons.share,
//                     color: Theme.of(context).iconTheme.color,
//                   ),
//                 ),
//             ]),
//         body: SingleChildScrollView(
//           child: SizedBox(
//             height: height,
//             width: width,
//             child: BlocConsumer<PDFCubit, PDFState>(builder: (context, state) {
//               if (pdf != null) {
//                 return buildPDFPreview(context, pdf!);
//               }

//               return ModalProgressHUD(
//                 inAsyncCall: state is PDFUploadingState,
//                 child: Column(
//                   children: [
//                     TextButton.icon(
//                       onPressed: _handleSelectFile,
//                       icon: const Icon(Icons.insert_drive_file_outlined),
//                       label: const Text('Select Files'),
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: _files.length,
//                       itemBuilder: (context, index) {
//                         final file = _files[index];
//                         final fileName = file.path.split('/').last;

//                         return ListTile(
//                           title: Text(fileName),
//                           trailing: IconButton(
//                             onPressed: () {
//                               _handleDelete(index);
//                             },
//                             icon: const Icon(Icons.delete_outline),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             }, listener: (context, state) {
//               if (state is PDFSuccessState) {
//                 print(state.file.path);

//                 pdf = state.file;

//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('PDFs Merged'),
//                   ),
//                 );
//               } else if (state is PDFErrorState) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: const Text('Could not merge PDFs'),
//                     backgroundColor: Theme.of(context).colorScheme.error,
//                   ),
//                 );
//               }
//             }),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildPDFPreview(BuildContext context, File pdf) {
//     final size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             width: size.width,
//             height: size.height,
//             padding: const EdgeInsets.all(16),
//             child: SfPdfViewer.file(pdf),
//           ),
//           Text('Location: ${pdf.path}'),
//         ],
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:itax/config/colors.dart';
// import 'package:itax/presentation/widgets/blue_button.dart';
// import 'package:pdf_manipulator/pdf_manipulator.dart';
// import 'package:pick_or_save/pick_or_save.dart';

// class MergePdfScreen extends StatefulWidget {
//   const MergePdfScreen({Key? key}) : super(key: key);

//   @override
//   State<MergePdfScreen> createState() => _MergePdfScreenState();
// }

// class _MergePdfScreenState extends State<MergePdfScreen> {
//   final _pdfManipulatorPlugin = PdfManipulator();
//   final _pickOrSavePlugin = PickOrSave();

//   List<String> _pickedFilesForMerging = [];
//   String? _mergedPDFPath;
//   bool _isBusy = false;

//   /// Merge PDFs
//   Future<String?> _mergePDFs(MergePdfScreen params) async {
//     String? result;
//     try {
//       result = await _pdfManipulatorPlugin.mergePDFs(params: params);
//     } on PlatformException catch (e) {
//       print('Error merging PDFs: $e');
//     } catch (e) {
//       print('Unexpected error: $e');
//     }
//     return result;
//   }

//   /// Pick multiple PDF files
//   Future<List<String>?> _filePicker(FilePickerParams params) async {
//     List<String>? result;
//     try {
//       setState(() {
//         _isBusy = true;
//       });
//       result = await _pickOrSavePlugin.filePicker(params: params);
//     } on PlatformException catch (e) {
//       print('Error picking files: $e');
//     } catch (e) {
//       print('Unexpected error: $e');
//     }
//     setState(() {
//       _isBusy = false;
//     });
//     return result;
//   }

//   /// Save merged PDF
//   Future<List<String>?> _fileSaver(FileSaverParams params) async {
//     List<String>? result;
//     try {
//       setState(() {
//         _isBusy = true;
//       });
//       result = await _pickOrSavePlugin.fileSaver(params: params);
//     } on PlatformException catch (e) {
//       print('Error saving file: $e');
//     } catch (e) {
//       print('Unexpected error: $e');
//     }
//     setState(() {
//       _isBusy = false;
//     });
//     return result;
//   }

//   void callSnackBar({required BuildContext context, required String text}) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: AppGradients.mainGradient,
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
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Spacer(),
//             Card(
//               margin: EdgeInsets.zero,
//               child: Padding(
//                 padding: EdgeInsets.all(8.w),
//                 child: Column(
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: _pickedFilesForMerging.isEmpty
//                             ? const Color.fromARGB(255, 191, 191, 191)
//                             : mainBlueColor,
//                       ),
//                       onPressed: _isBusy
//                           ? null
//                           : () async {
//                               final params = FilePickerParams(
//                                 localOnly: true,
//                                 mimeTypesFilter: ["application/pdf"],
//                                 allowedExtensions: [".pdf"],
//                               );

//                               List<String>? result = await _filePicker(params);

//                               if (result != null && result.isNotEmpty) {
//                                 setState(() {
//                                   _pickedFilesForMerging = result;
//                                 });
//                                 callSnackBar(
//                                   context: context,
//                                   text: "Files picked successfully.",
//                                 );
//                               } else {
//                                 callSnackBar(
//                                   context: context,
//                                   text: "No files selected.",
//                                 );
//                               }
//                             },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.upload_file),
//                           Text(
//                             'Pick PDF Files',
//                             style:
//                                 TextStyle(fontSize: 16.sp, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 28.h),
//                     BlueButton(
//                       onPressed: _pickedFilesForMerging.isEmpty
//                           ? () {
//                               callSnackBar(
//                                 context: context,
//                                 text: "Please select PDF files to merge.",
//                               );
//                             }
//                           : () async {
//                               final params = (
//                                 pdfPaths: _pickedFilesForMerging,
//                               );

//                               String? result = await _mergePDFs();

//                               if (result != null && result.isNotEmpty) {
//                                 setState(() {
//                                   _mergedPDFPath = result;
//                                 });
//                                 callSnackBar(
//                                   context: context,
//                                   text: "PDFs merged successfully.",
//                                 );
//                               } else {
//                                 callSnackBar(
//                                   context: context,
//                                   text: "PDF merging failed.",
//                                 );
//                               }
//                             },
//                       title: 'Merge PDFs',
//                     ),
//                     const SizedBox(height: 8),
//                     BlueButton(
//                       onPressed: _mergedPDFPath == null
//                           ? () {
//                               callSnackBar(
//                                 context: context,
//                                 text: "No merged PDF to save.",
//                               );
//                             }
//                           : () async {
//                               final params = FileSaverParams(
//                                 localOnly: true,
//                                 saveFiles: [
//                                   SaveFileInfo(
//                                     filePath: _mergedPDFPath!,
//                                     fileName: "Merged PDF.pdf",
//                                   ),
//                                 ],
//                               );

//                               List<String>? result = await _fileSaver(params);

//                               if (result != null && result.isNotEmpty) {
//                                 callSnackBar(
//                                   context: context,
//                                   text: "Merged PDF saved successfully.",
//                                 );
//                               } else {
//                                 callSnackBar(
//                                   context: context,
//                                   text: "Failed to save merged PDF.",
//                                 );
//                               }
//                             },
//                       title: 'Save Merged PDF',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Spacer()
//           ],
//         ),
//       ),
//     );
//   }
// }
