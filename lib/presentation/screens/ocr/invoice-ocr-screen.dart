import 'dart:io';

import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/ocr_cubit.dart';
import 'package:itax/cubits/ocr_state.dart';
import 'package:itax/models/invoice_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/presentation/screens/ocr/widgets/invoice-details-widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class InvoiceOCRScreen extends StatefulWidget {
  const InvoiceOCRScreen({super.key});

  @override
  State<InvoiceOCRScreen> createState() => _InvoiceOCRScreenState();
}

class _InvoiceOCRScreenState extends State<InvoiceOCRScreen> {
  late final String? token;

  File? _file;

  InvoiceModel? _data;

  @override
  initState() {
    super.initState();

    token = BlocProvider.of<AuthCubit>(context, listen: false)
        .getLoggedInUser()
        .token;
  }

  _handleSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      if (result.paths.isEmpty) {
        return;
      }

      final file = result.paths.first!;

      setState(() {
        _file = File(file);
      });
    } else {
      // User canceled the picker
    }
  }

  _handleExtract() {
    if (token != null && _file != null) {
      BlocProvider.of<OCRCubit>(context, listen: false)
          .extractInvoice(file: _file!, token: token!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    return SafeArea(
        child: BlocConsumer<OCRCubit, OCRState>(builder: (context, state) {
      return ModalProgressHUD(
          inAsyncCall: state is OCRUploadingState,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
              backgroundColor: Theme.of(context).colorScheme.surface,
              centerTitle: true,
              elevation: 0,
              title: const Text(
                'Invoice OCR',
                // style: Theme.of(context).textTheme.titleLarge,
              ),
              actions: [
                if (_file != null && _data == null)
                  TextButton(
                    onPressed: _handleExtract,
                    child: const Text('Extract'),
                  ),
              ],
            ),
            body: SingleChildScrollView(
              child: _data != null
                  ? InvoiceDetailsWidget(
                      invoice: _data!,
                    )
                  : SizedBox(
                      width: width,
                      child: Column(
                        children: [
                          Visibility(
                            visible: _file == null,
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: _handleSelectFile,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16.0),
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.insert_drive_file_outlined,
                                          size: 48.0,
                                        ),
                                        SizedBox(height: 16.0),
                                        Text(
                                          'Select Files',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _file != null
                              ? buildPDFPreview(context, _file!)
                              : const SizedBox(),
                        ],
                      ),
                    ),
            ),
          ));
    }, listener: (context, state) {
      if (state is OCRInvoiceSuccessState) {
        print('State path: ${state.data}');

        setState(() {
          _data = state.data;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data Extracted'),
          ),
        );
      } else if (state is OCRErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
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
          // Expanded(
          //   child: SfPdfViewer.file(pdf),
          // ),
          const SizedBox(height: 16),
          Text(pdf.path.split('/').last),
        ],
      ),
    );
  }
}
