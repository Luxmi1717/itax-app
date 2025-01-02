import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/cubits/pan_details_state.dart';

import '../repositories/pan_details_repository.dart';

class PanDetailsCubit extends Cubit<PanDetailsState> {
  final PanDetailsRepository repository;

  PanDetailsCubit(this.repository) : super(PanDetailsInitial());

  Future<void> getPanDetails(String token, String pan) async {
    emit(PanDetailsLoading());

    try {
      final panDetails = await repository.getPanDetails(token, pan);

      emit(PanDetailsSuccess(panDetails));
      emit(PanDetailsInitial());
    } catch (e) {
      emit(PanDetailsError(e.toString()));
    }
  }
}
