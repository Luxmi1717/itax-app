import 'package:bloc/bloc.dart';
import 'package:itax/models/startup/get_stratup.dart';
import 'package:meta/meta.dart';

import '../repositories/stratup_repository.dart';

part 'stratup_state.dart';

class StratupCubit extends Cubit<StratupState> {
  StartupRepository startupRepository;
  StratupCubit({required this.startupRepository}) : super(StratupInitial());


  Future<void> GetAllstartupData(String token) async {
    emit(StratupLoading());

    try {
      final result = await startupRepository.getStartupDetails(token);
      emit(StratupLoaded(result));
    } catch (e) {
      emit(StratupError(e.toString()));
    }
  }
}
