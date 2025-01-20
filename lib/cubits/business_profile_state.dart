import 'package:itax/models/profile-models/business_profile_model.dart';

abstract class BusinessProfileState {}

class BusinessProfileInitialState extends BusinessProfileState {}

class BusinessProfileLoadingState extends BusinessProfileState {}

class BusinessProfileLoadedState extends BusinessProfileState {
  final BusinessProfileModel businessProfile;

  BusinessProfileLoadedState({required this.businessProfile});
}

class BusinessProfileUpdatingState extends BusinessProfileState {}
