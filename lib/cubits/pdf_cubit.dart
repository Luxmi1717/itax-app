import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/pdf_state.dart';
import 'package:itax/repositories/pdf_repository.dart';

class PDFCubit extends Cubit<PDFState> {
  PDFRepository pdfRepository;

  PDFCubit({required this.pdfRepository}) : super(PDFInitialState());


Future<void> mergePDF(
    {required List<File> files, required String savePath}) async {
  try {
    // Emit uploading state
    emit(PDFUploadingState());

    // Convert the list of File objects into a list of file paths
    List<String> filePaths = files.map((file) => file.path).toList();

    // Call the merge function with the list of file paths and the path where the merged file should be saved
    //  pdfRepository.mergeMultiplePDF(savePath, filePaths);
// un comment the above line 






























    // Create a File object from the merged file path
    final mergedFile = File(savePath);

    // Emit the success state with the merged file
    emit(PDFSuccessState(file: mergedFile));
    print('PDF merged and saved at: $savePath');
  } catch (e) {
    // Handle errors and emit error state
    if (kDebugMode) {
      print(e);
    }
    emit(PDFErrorState(message: e.toString()));
  }
}


  Future<void> convertToPdf(
      {required List<File> files}) async {
    try {
      emit(PDFUploadingState());
      final file = await pdfRepository.generateImagePdf(imageFiles: files);
      emit(PDFSuccessState(file: file));
      emit(PDFInitialState());
    } catch (e) {
      emit(PDFErrorState(message: e.toString()));
    }
  }
}
