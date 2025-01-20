import '../models/profile-models/aadhaar_model.dart';
import '../models/invoice_model.dart';
import '../models/profile-models/pan_model.dart';

abstract class OCRState {}

class OCRInitialState extends OCRState {}

class OCRUploadingState extends OCRState {}

class OCRUploadedState extends OCRState {}

class OCRPANSuccessState extends OCRState {
  final PanModel data;

  OCRPANSuccessState({required this.data});
}

class OCRAadhaarSuccessState extends OCRState {
  final AadhaarModel data;

  OCRAadhaarSuccessState({required this.data});
}

class OCRInvoiceSuccessState extends OCRState {
  final InvoiceModel data;

  OCRInvoiceSuccessState({required this.data});
}

class OCRDeletingState extends OCRState {}

class OCRDeleteSuccessState extends OCRState {}

class OCRDeleteErrorState extends OCRState {
  final String message;

  OCRDeleteErrorState({required this.message});
}

class OCRErrorState extends OCRState {
  final String message;

  OCRErrorState({required this.message});
}
