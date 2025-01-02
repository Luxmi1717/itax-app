import 'dart:io';

abstract class PDFState {}

class PDFInitialState extends PDFState {}

class PDFUploadingState extends PDFState {}

class PDFUploadedState extends PDFState {}

class PDFSuccessState extends PDFState {
  final File file;

  PDFSuccessState({required this.file});
}

class PDFErrorState extends PDFState {
  final String message;

  PDFErrorState({required this.message});
}
