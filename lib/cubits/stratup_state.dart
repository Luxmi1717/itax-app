part of 'stratup_cubit.dart';

@immutable
abstract class StratupState {}

class StratupInitial extends StratupState {}
class StratupLoading extends StratupState{}
class StratupLoaded extends StratupState{
   final AllStratupModel StartupData;

  StratupLoaded(this.StartupData);

}
class StratupError extends StratupState{
  final String ErrorMassage;

  StratupError(this.ErrorMassage);
}

