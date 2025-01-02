import '../models/pan_details_model.dart';

abstract class PanDetailsState {}

class PanDetailsInitial extends PanDetailsState {}

class PanDetailsLoading extends PanDetailsState {}

class PanDetailsSuccess extends PanDetailsState {
  final PanDetails panDetails;

  PanDetailsSuccess(this.panDetails);
}

class PanDetailsError extends PanDetailsState {
  final String error;

  PanDetailsError(this.error);
}
