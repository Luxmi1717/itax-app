import 'dart:io';

import 'package:itax/cubits/auth_cubit.dart';
import 'package:itax/cubits/ocr_cubit.dart';
import 'package:itax/cubits/ocr_state.dart';
import 'package:itax/models/pan_model.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/presentation/screens/ocr/widgets/pan-details-widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



class PanOCRScreen extends StatefulWidget {
  const PanOCRScreen({super.key});

  @override
  State<PanOCRScreen> createState() => _PanOCRScreenState();
}

class _PanOCRScreenState extends State<PanOCRScreen> {
  late final String? token;

  File? _file;

  PanModel? _data;

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
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      if (result.paths.isEmpty) {
        return;
      }

      final filePath = result.paths.first;

      setState(() {
        _file = filePath != null ? File(filePath) : null;
      });
    } else {
      // User canceled the picker
    }
  }

  _handleExtract() {
    if (token != null && _file != null) {
      BlocProvider.of<OCRCubit>(context, listen: false)
          .extractPAN(file: _file!, token: token!);
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
            leading: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
            backgroundColor: Theme.of(context).colorScheme.surface,
            centerTitle: true,
            elevation: 0,
            title: const Text(
              'Pan OCR',
              // style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              if (_file != null)
                TextButton(
                  onPressed: _handleExtract,
                  child: const Text('Extract'),
                ),
            ],
          ),
          body: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: _data != null
                  ? PanDetailsTable(
                      panModel: _data!,
                    )
                  : Column(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                            ? Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Selected Image',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.file(
                                            File(_file!.path),
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
                                                _file = null;
                                              });
                                            },
                                            child: const Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is OCRPANSuccessState) {
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
}
