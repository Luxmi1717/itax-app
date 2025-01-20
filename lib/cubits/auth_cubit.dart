import 'dart:convert';


import 'package:go_router/go_router.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/new_models/new_user_model.dart';
import 'package:itax/models/user_model.dart';

import '../models/bussiness_model.dart';
import '../repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());
  late String OTP = '';
  late String token='';

  Future<void> generateOTP(String email, String password) async {
      print('generate otp cubit started');
    try {


      emit(AuthLoading());

      final response = await authRepository.generateOTP(email, password);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        print('check hello');


        final user = NewUserModel.fromJSON(json['data']["user"]);
        final token = json['data']['token'];
        print(token);

        await authRepository.saveUser(user, token);
        await loadLoggedInUser();
        emit(AuthSuccess(loggedIn: token != ''));


        // emit(AuthOTPSentSuccess());
        // emit(AuthOTPVerificationPending());
      } else {
        emit(AuthError(message: 'OTP generation failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signUp(NewUserModel user) async {
    try {
      emit(AuthLoading());

      final response = await authRepository.signUp(user);


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final user = NewUserModel.fromJSON(json['results']['data']);
        final token = json['results']['token'];
        print(token);

        await authRepository.saveUser(user, token);

        emit(AuthOTPSentSuccess());
        emit(AuthOTPVerificationPending());
      } else {
        emit(AuthError(message: 'OTP generation failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> CreateBussinessProfile(BusinessData user) async {
    try {
      emit(AuthLoading());
      final response = await authRepository.CreateBussinessProfile(user);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        emit(AuthError(message: 'Update failled'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> updateProfile(NewUserModel user) async {
    try {
      emit(AuthProfileUpdating());

      final response = await authRepository.updateProfile(user.toJSON());

      if (response.statusCode == 200) {
        await UserSecureStorage.saveUser(user, authRepository.token);

        emit(AuthProfileUpdateSuccess());
      } else {
        final message = jsonDecode(response.body)["message"];
        print(response.body);
        emit(AuthProfileError(message: message));
      }
    } catch (e) {
      emit(AuthProfileError(message: e.toString()));
    }
  }

  Future<void> regenerateOTP() async {
    try {
      emit(AuthLoading());

      final response = await authRepository.generateOTP(
        authRepository.email,
        authRepository.password,
      );

      if (response.statusCode == 200) {
        emit(AuthOTPSentSuccess());
        emit(AuthOTPVerificationPending());
      } else {
        emit(AuthError(message: 'OTP generation failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> generateForgotPasswordOTP(String? email) async {
    try {
      emit(AuthLoading());

      final response = await authRepository.generateForgotPasswordOTP(email ?? authRepository.email);
      print(response.statusCode);
      if (response.statusCode == 200) {
        emit(AuthOTPSentSuccess(type: 'FORGET'));
        emit(AuthOTPVerificationPending());
      } else {
        emit(AuthError(message: 'OTP generation failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> changePassword(
      String newPassword, bool loggedIn, bool changedPassword) async {
    try {
      emit(AuthLoading());

      final response = await authRepository.changePassword(newPassword);
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        emit(AuthSuccess(loggedIn: loggedIn, changedPassword: changedPassword));
      } else {
        emit(AuthError(message: 'Could not change password'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> loadLoggedInUser() async {
    try {
      emit(AuthLoading());

      await authRepository.loadUser();

      emit(AuthSuccess(loggedIn: authRepository.token != ''));
    } catch (e) {
      print(e);
      emit(AuthError(message: 'Something went wrong.'));
    }
  }

  UserModel getLoggedInUser() {
    return UserModel(data: authRepository.user, token: authRepository.token);
  }

  Future<void> logout() async {
    try {
      emit(AuthLoading());
      authRepository.clearUser();
      
      


     
      emit(AuthSuccess(loggedIn: false));
    } catch (e) {
      AuthError(message: 'Could not logout');
    }
  }

  Future<void> verifyForgotPasswordOTP(String otp) async {
    OTP = otp;
    try {
      emit(AuthLoading());
      final response = await authRepository.verifyOTP(otp);

      if (response.statusCode == 200 || response.statusCode == 400) {
        emit(AuthPasswordResetPending());
        

        emit(AuthSuccess(loggedIn: false, fogotPassword: true));
      } else {
        emit(AuthError(message: 'Invalid OTP'));
      }
    } catch (e) {
      emit(AuthError(message: 'Failed to connect to server'));
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      emit(AuthLoading());
      final response = await authRepository.verifyOTP(otp);
      print(response.statusCode);
      print('taken$token');
      if (response.statusCode == 200) {

        await loadLoggedInUser();
        emit(AuthSuccess(loggedIn: token != ''));
      } else {
        emit(AuthError(message: 'Invalid OTP'));
      }
    } catch (e) {
      emit(AuthError(message: 'Failed to connect to server'));
    }
  }
}
