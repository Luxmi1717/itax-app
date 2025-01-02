import 'dart:io';

import 'package:itax/config/shared/types.dart';
import 'package:itax/models/itr_model.dart';


abstract class ITRState {}

class ITRInitialState extends ITRState {}

class ITRLoadingState extends ITRState {}

class ITRFileSelected extends ITRState {
  final File file;
  final Form16Type formType;

  ITRFileSelected({required this.file, required this.formType});
}

class ITRFileSelectionError extends ITRState {
  final String message;

  ITRFileSelectionError({required this.message});
}

class ITRUploadingState extends ITRState {}

class ITRProcessingForm16 extends ITRState {}

class ITRForm16Processed extends ITRState {
  ITRModel form16Data;

  ITRForm16Processed({required this.form16Data});
}

class ITRProcessingError extends ITRState {
  final String message;

  ITRProcessingError({required this.message});
}

class ITRDownloading extends ITRState {}

class ITRDownloaded extends ITRState {}

class ITRDownloadError extends ITRState {
  final String message;

  ITRDownloadError({required this.message});
}
