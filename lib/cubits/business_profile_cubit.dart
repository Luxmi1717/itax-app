

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itax/models/business_profile_model.dart';
import 'package:itax/repositories/business_profile_repository.dart';


abstract class BusinessProfileState {}

class BusinessProfileInitialState extends BusinessProfileState {}

class BusinessProfileLoadingState extends BusinessProfileState {}

class BusinessProfileLoadedState extends BusinessProfileState {
  final BusinessProfile businessProfile;

  BusinessProfileLoadedState({required this.businessProfile});
}

class BusinessProfileUpdatingState extends BusinessProfileState {}

class BusinessProfileErrorState extends BusinessProfileState {
  final String error;

  BusinessProfileErrorState({required this.error});
}

class BusinessProfileCubit extends Cubit<BusinessProfileState> {
  final BusinessProfileRepository repository;

  BusinessProfileCubit({required this.repository})
      : super(BusinessProfileInitialState());

  Future<void> getBusinessProfile(String bearerToken,context) async {
    emit(BusinessProfileLoadingState());

    try {
      final businessProfile = await repository.fetchBusinessProfile(bearerToken);

     // Provider.of<GstBussinessData>(context).SetBussinesData(businessProfile.result!);
      emit(BusinessProfileLoadedState(businessProfile: businessProfile));
    } catch (e) {
      emit(BusinessProfileErrorState(error: 'Business profile not ready.'));
    }
  }

  Future<void> getBusinessProfileFromGstin(
      String bearerToken, String gstin) async {
    emit(BusinessProfileLoadingState());

    try {
      final businessProfile = await repository.fetchBusinessProfileFromApi(
          bearerToken, gstin.toUpperCase());
      emit(BusinessProfileLoadedState(businessProfile: businessProfile));
    } catch (e) {
      emit(BusinessProfileErrorState(error: 'Failed to get business profile'));
    }
  }

  Future<void> updateBussinessProfile(
      String bearerToken, BusinessProfile businesProfile) async {
    emit(BusinessProfileUpdatingState());
    try {
      print('check');
      final updatedBusinessProfile = await repository.createOrUpdateBusinessProfile(bearerToken, businesProfile);
      emit(BusinessProfileLoadedState(businessProfile: updatedBusinessProfile));
    } catch (e) {
      emit(BusinessProfileErrorState(
          error: 'Failed to update business profile'));
    }
  }
}
