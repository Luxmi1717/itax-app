import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/config/shared/types.dart';
import 'package:itax/cubits/itr_state.dart';
import 'package:itax/repositories/itr_repository.dart';

import '../models/itr_model.dart';

class ITRCubit extends Cubit<ITRState> {
  final ITRRepository itrRepository;

  ITRCubit({required this.itrRepository}) : super(ITRInitialState());

  Future<void> selectFile(Form16Type formType) async {
    try {
      final file = await itrRepository.selectFile();

      if (file == null) {
        emit(ITRFileSelectionError(message: 'File not found'));
      } else {
        emit(ITRFileSelected(file: file, formType: formType));
      }
    } catch (e) {
      emit(ITRFileSelectionError(message: 'Could not select file'));
    }
  }

  Future<void> processForm16(File file, Form16Type form16type) async {
    try {
      emit(ITRProcessingForm16());
      final form16Data = await itrRepository.uploadPDF(file, form16type);

      print(form16Data);

      if (kDebugMode) {
        print('Uploaded Form-16');
      }

      if (form16Data != null) {
        itrRepository.form16Data = form16Data;

        emit(ITRForm16Processed(form16Data: form16Data));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(ITRProcessingError(message: 'Could not process Form 16'));
    }
  }

  Future<void> openForm16(ITRModel model) async {
    try {
      emit(ITRForm16Processed(form16Data: model));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(ITRProcessingError(message: 'Could not process Form 16'));
    }
  }

  Future<void> saveJson({
    required data,
    required aadhaar,
    required pan,
    required address,
    required dob,
    required fatherName,
    required bankAccountNo,
    required bankName,
    required ifscCode,
  }) async {
    try {
      emit(ITRDownloading());
      itrRepository.saveJsonFile(
        data: data,
        aadhaar: aadhaar,
        pan: pan,
        address: address,
        dob: dob,
        fatherName: fatherName,
        bankAccountNo: bankAccountNo,
        bankName: bankName,
        ifscCode: ifscCode,
      );
      emit(ITRDownloaded());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(ITRDownloadError(message: e.toString()));
    }
  }
}
