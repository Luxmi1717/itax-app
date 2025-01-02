import 'dart:io';

// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/pdf_cubit.dart';
import 'package:itax/cubits/pdf_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class ImageToPDFScreen extends StatefulWidget {
  const ImageToPDFScreen({super.key});

  @override
  State<ImageToPDFScreen> createState() => _ImageToPDFScreenState();
}

class _ImageToPDFScreenState extends State<ImageToPDFScreen> {
  final List<File> _files = [];
  late final String? token;

  File? pdf;

  @override
  initState() {
    super.initState();

    token = BlocProvider.of<AuthCubit>(context, listen: false)
        .getLoggedInUser()
        .token;
  }

  _handleSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png', 'jpg', 'gif'],
    );

    if (result != null) {
      setState(() {
        _files.addAll(result.paths.map((e) => File(e!)).toList());
      });
    } else {
      // User canceled the picker
    }
  }

  _handleConvert() {
    BlocProvider.of<PDFCubit>(context, listen: false)
        .convertToPdf(files: _files);
  }

  Future<void> _handleShare() async {
    try {
      final file = pdf!;
      final fileUri = Uri.file(file.path);

      await FlutterShare.shareFile(
        title: 'Merged PDF',
        filePath: file.path,
        fileType: 'application/pdf',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF shared successfully')),
      );
    } on PlatformException catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not share file: ${e.message}'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    return SafeArea(
        child: BlocConsumer<PDFCubit, PDFState>(builder: (context, state) {
      return ModalProgressHUD(
          inAsyncCall: state is PDFUploadingState,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  GoRouter.of(context).pop(context);
                },
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              centerTitle: true,
              elevation: 0,
              title: const Text(
                'Image to PDF',
                // style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                if (_files.isNotEmpty && pdf == null)
                  TextButton(
                    onPressed: _handleConvert,
                    child: const Text('Convert'),
                  ),
                if (pdf != null)
                  IconButton(
                    onPressed: _handleShare,
                    icon: Icon(Icons.share,
                        color: Theme.of(context).iconTheme.color),
                  ),
              ],
            ),
            body: SingleChildScrollView(
              child: pdf != null
                  ? buildPDFPreview(context, pdf!)
                  : SizedBox(
                      width: width,
                      height: height,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: TextButton.icon(
                                  onPressed: _handleSelectFile,
                                  icon: const Icon(
                                      Icons.insert_drive_file_outlined),
                                  label: const Text('Select Files'),
                                ),
                              ),
                              Visibility(
                                visible: _files.isNotEmpty,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Selected Images',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                      GridView.builder(
                                        padding: const EdgeInsets.all(8.0),
                                        itemCount: _files.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          String filePath = _files[index].path;

                                          return Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  File(filePath),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Positioned(
                                                top: 4.0,
                                                right: 4.0,
                                                child: FloatingActionButton(
                                                  mini: true,
                                                  onPressed: () {
                                                    setState(() {
                                                      _files.removeAt(index);
                                                    });
                                                  },
                                                  child:
                                                      const Icon(Icons.delete),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ));
    }, listener: (context, state) {
      if (state is PDFSuccessState) {
        print('State path: ${state.file.path}');

        pdf = state.file;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('PDF Created'),
          ),
        );
      } else if (state is PDFErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Could not create PDF'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }));
  }

  Widget buildPDFPreview(BuildContext context, File pdf) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 196, 215, 230),
          width: 16,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SfPdfViewer.file(pdf),
          ),
          const SizedBox(height: 16),
          Text(pdf.path.split('/').last),
        ],
      ),
    );
  }
}
