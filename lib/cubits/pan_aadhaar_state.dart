abstract class PanAadhaarStatusState {}

class PanAadhaarStatusInitial extends PanAadhaarStatusState {}

class PanAadhaarStatusLoading extends PanAadhaarStatusState {}

class PanAadhaarStatusSuccess extends PanAadhaarStatusState {
  final String result;

  PanAadhaarStatusSuccess(this.result);
}

class PanAadhaarStatusError extends PanAadhaarStatusState {
  final String error;

  PanAadhaarStatusError(this.error);
}
