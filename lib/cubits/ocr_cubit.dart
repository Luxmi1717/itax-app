import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/repositories/ocr_repository.dart';

import '../models/profile-models/aadhaar_model.dart';
import '../models/profile-models/pan_model.dart';
import 'ocr_state.dart';

class OCRCubit extends Cubit<OCRState> {
  OCRRepository ocrRepository;

  OCRCubit({required this.ocrRepository}):super(OCRInitialState());

  Future<void> extractAadhaar({required File file, required String  token}) async
  {
    try {
      emit(OCRUploadingState());
      final data = await ocrRepository.extractAadhaarDetails(file, token);
      emit(OCRAadhaarSuccessState(data: data));
      emit(OCRInitialState());
    }
    catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(OCRErrorState(message:e.toString()));
    }
  }

  Future<void> extractInvoice({required File file, required String token}) async
  {
    try {
      emit(OCRUploadingState());
      final data = await ocrRepository.extractInvoiceDetails(file, token);
      emit(OCRInvoiceSuccessState(data: data));
      emit(OCRInitialState());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(OCRErrorState(message: e.toString()));
    }
  }

  Future<void> extractPAN({required File file, required String token}) async
  {

    try {
      emit(OCRUploadingState());
      final data = await ocrRepository.extractPanDetails(file, token);
      emit(OCRPANSuccessState(data: data));
      emit(OCRInitialState());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(OCRErrorState(message: e.toString()));
    }
  }

  Future<void> deleteAadhaar({required AadhaarModel model}) async {
    try {
      emit(OCRUploadingState());
      await ocrRepository.deleteAadhaarModel(model);
      emit(OCRInitialState());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(OCRErrorState(message: e.toString()));
    }
  }

  Future<void> deletePAN({required PanModel model}) async {
    try {
      emit(OCRUploadingState());
      await ocrRepository.deletePanModel(model);
      emit(OCRInitialState());
    } catch (e) {
      if (kDebugMode) {print(e);}
      emit(OCRErrorState(message: e.toString()));

    }
  }
}
