import 'dart:io';

import 'package:flutter_share/flutter_share.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/config/colors.dart';
import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/pdf_cubit.dart';
import 'package:itax/cubits/pdf_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MergePDFScreen extends StatefulWidget {
  const MergePDFScreen({super.key});

  @override
  State<MergePDFScreen> createState() => _MergePDFScreenState();
}

class _MergePDFScreenState extends State<MergePDFScreen> {
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
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _files.addAll(result.paths.map((e) => File(e!)).toList());
      });
    } else {
      // User canceled the picker
    }
  }

  _handleDelete(index) {
    final file = _files[index];

    setState(() {
      _files.remove(file);
    });
  }

  _handleMerge() async {
    final root = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    if (token != null) {
      BlocProvider.of<PDFCubit>(context, listen: false)
          .mergePDF(files: _files, savePath: '${root!.path}/merged.pdf');
    }
  }

  _handleShare() async {
    try {
      await FlutterShare.shareFile(title: 'Merged PDF', filePath: pdf!.path);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('PDF shared')),
        );
      }
    } catch (e) {
      print(e);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Could not share file'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios, color: whiteColor,),
            backgroundColor: Theme.of(context).colorScheme.surface,
            centerTitle: true,
            elevation: 0,
            title: const Text(
              'Merge PDFs',
              // style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              if (_files.isNotEmpty && pdf == null)
                TextButton(
                  onPressed: _handleMerge,
                  child: const Text('Merge'),
                ),
              if (pdf != null)
                IconButton(
                  onPressed: _handleShare,
                  icon: Icon(
                    Icons.share,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
            ]),
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: BlocConsumer<PDFCubit, PDFState>(builder: (context, state) {
              if (pdf != null) {
                return buildPDFPreview(context, pdf!);
              }

              return ModalProgressHUD(
                inAsyncCall: state is PDFUploadingState,
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: _handleSelectFile,
                      icon: const Icon(Icons.insert_drive_file_outlined),
                      label: const Text('Select Files'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _files.length,
                      itemBuilder: (context, index) {
                        final file = _files[index];
                        final fileName = file.path.split('/').last;

                        return ListTile(
                          title: Text(fileName),
                          trailing: IconButton(
                            onPressed: () {
                              _handleDelete(index);
                            },
                            icon: const Icon(Icons.delete_outline),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }, listener: (context, state) {
              if (state is PDFSuccessState) {
                print(state.file.path);

                pdf = state.file;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('PDFs Merged'),
                  ),
                );
              } else if (state is PDFErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Could not merge PDFs'),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget buildPDFPreview(BuildContext context, File pdf) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(16),
            child: SfPdfViewer.file(pdf),
          ),
          Text('Location: ${pdf.path}'),
        ],
      ),
    );
  }
}
