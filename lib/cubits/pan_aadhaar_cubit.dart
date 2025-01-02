import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/pan_aadhaar_state.dart';

import '../repositories/pan_aadhaar_repository.dart';

class PanAadhaarStatusCubit extends Cubit<PanAadhaarStatusState> {
  final PanAadhaarRepository repository;

  PanAadhaarStatusCubit(this.repository) : super(PanAadhaarStatusInitial());

  Future<void> checkPanAadhaarStatus(String pan, String aadhaar) async {
    emit(PanAadhaarStatusLoading());

    try {
      final result = await repository.checkPanAadhaarStatus(pan, aadhaar);
      emit(PanAadhaarStatusSuccess(result));
    } catch (e) {
      emit(PanAadhaarStatusError(e.toString()));
    }
  }
}
