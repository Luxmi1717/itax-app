import 'dart:convert';

import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/models/new_user_model.dart';

import 'package:http/http.dart' as http;

import '../models/bussiness_model.dart';

class AuthRepository {
  //final baseUrl = 'https://node.itaxeasy.com';
  // final baseUrl = 'http://10.0.2.2:8080';
  final baseUrl = 'https://api.itaxeasy.com';

  String otpId = '';
  String email = '';
  String password = '';
  String token = '';
  NewUserModel? user;
  String Otp = '';

  Future<http.Response> generateOTP(email, password) async {
    print('login has started');
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      body: json.encode({
        "email": email,
        "password": password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);
    print(response.statusCode);
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw http.ClientException(jsonResponse['message']);
    }
    //final otpId = jsonResponse['results']['data']['id'].toString();
    print(' otpId =$otpId');

    //this.otpId = otpId;
    this.email = email;
    this.password = password;

    return response;
  }
  

  Future<http.Response> signUp(NewUserModel user) async {
    print("Request payload: ${user.toJSON()}");

    // Step 1: Send sign-up request
    final response = await http.post(
      Uri.parse('$baseUrl/user/sign-up'),
      body: json.encode({
        "firstName": user.firstName ?? '',
        "lastName": user.lastName ?? '',
        "phone": user.phone ?? '',
        "email": user.email ?? '',
        "password": user.password ?? '',
        "pin": user.pincode ?? '',
        "gender": user.gender ?? 'male',
        "aadhar": user.aadhaar ?? '',
        "pan": user.pan ?? '',
        "address": user.address ?? '',
      }),
      headers: {'Content-Type': 'application/json'},
    );

    print("SignUp Response: ${response.body}");

    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (jsonResponse['success'] == true) {
        // Extract `data` safely
        final data = jsonResponse['data'];
        if (data != null) {
          final otpKey = data['otp_key'];
          if (otpKey != null) {
            otpId = otpKey.toString(); // Save the OTP key
            email = user.email ?? '';
            password = user.password ?? '';
            print('The OTP key is: $otpKey');
          } else {
            throw http.ClientException(
                'The `otp_key` is missing in the response.');
          }
        } else {
          throw http.ClientException(
              'The `data` field is missing in the response.');
        }
      } else {
        final message =
            jsonResponse['message'] ?? 'Sign-up failed without a message.';
        throw http.ClientException(message);
      }
    } else {
      // Handle non-200 status codes
      final message =
          jsonResponse['message'] ?? 'An unexpected error occurred.';
      throw http.ClientException(message);
    }

    return response;
  }

  //O R I G I N A L    F U N C T I O N A L I T Y

// Future<http.Response> signUp(NewUserModel user) async {
//     print(user.toJSON().toString());

//     final response = await http.post(
//       Uri.parse('$baseUrl/user/sign-up'),
//       body: json.encode({
//         "first_name": user.firstName,
//         "last_name": user.lastName,
//         "phone": user.phone,
//         "email": user.email,
//         "password":user.password,
//         "pincode": user.pincode,

//       }),
//       headers: {'Content-Type': 'application/json'},
//     );

//     final jsonResponse = jsonDecode(response.body);
//     print(jsonResponse);
//     if(response.statusCode==200){

//       final response = await http.post(
//         Uri.parse('$baseUrl/email/otp'),
//         body: json.encode({
//           "email":user.email,
//           "type":"VERIFICATION"

//         }),
//         headers: {'Content-Type': 'application/json'},

//       );

//       final jsonResponse = jsonDecode(response.body);
//       print(jsonResponse);
//       final otpId = jsonResponse['data']['otp_id'].toString();
//         print('otp$otpId');
//       this.otpId = otpId;
//       email = user.email;
//       password = user.password ?? '';

//     } else {

//       final message = jsonResponse['message'];
//       throw http.ClientException(message);
//     }

//     return response;
//   }

  Future<http.Response> CreateBussinessProfile(BusinessData user) async {
    print(user.toJson().toString());

    final response = await http.post(
      Uri.parse('$baseUrl/users/create-business-profile'),
      body: json.encode({
        "ifsc": user.ifsc,
        "businessName": user.businessName,
        "bankAccountNo": user.bankAccountNo,
        "companyPanNo": user.companyPanNo,
        "companyTanNo": user.companyTanNo,
        "msmeNo": user.msmeNo,
        "gstNo": user.gstNo,
        "state": user.state,
        "branch": user.branch,
        "tradename": user.tradeName,
        "status": user.state,
        "address": user.address,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);

    if (response.statusCode != 200) {
      final message = jsonDecode(response.body)['message'];
      throw http.ClientException(message);
    }

    return response;
  }

  Future<http.Response> generateForgotPasswordOTP(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/forgot-password'),
      body: json.encode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
          'Could not generate OTP: ${jsonResponse['message']}');
    }

    final otpId = jsonResponse['otp_key'].toString();
    this.otpId = otpId;
    this.email = email;

    return response;
  }

  Future<http.Response> verifyOTP(otp) async {
    print('hello$otpId');
    Otp = otp;
    final response = await http.post(
      Uri.parse('$baseUrl/user/verify'),
      body: json.encode({
        "email": email,
        "otp_key": otpId,
        "otp": otp,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print('otp ${response.body}');

    return response;
  }

  Future<http.Response> changePassword(newPassword) async {
    print(Otp);
    final response = await http.post(
      Uri.parse('$baseUrl/user/change-password'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'newPassword': newPassword,
        "otp_key": otpId,
        "otp": Otp,
      }),
    );
    print('hello ${response.body}');

    return response;
  }

  Future<http.Response> updateProfile(String userJSON) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/update'),
      headers: {
        'Authorization': 'Basic $token',
        'Content-Type': 'application/json',
      },
      body: userJSON,
    );

    return response;
  }

  Future<void> saveUser(user, token) async {
    await UserSecureStorage.saveUser(user, token);
  }

  Future<void> loadUser() async {
    final userData = await UserSecureStorage.getUser();
    if (userData == null) {
      return;
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print(response.body);

    token = userData['token'];

    if (response.statusCode != 200) {
      print("Using stale user data");
      user = userData['user'];
      return;
    }

    final data = jsonDecode(response.body)["data"];

    user = NewUserModel(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'],
      phone: data['phone'],
      aadhaar: data['aadhaar'] ?? '',
      pan: data['pan'] ?? '',
      dob: data['dob'] ?? '',
      gender: data['gender'] ?? '',
      fatherName: data['fatherName'] ?? '',
    );

    UserSecureStorage.saveUser(user!, token);
  }

  Future<void> clearUser() async {
    await UserSecureStorage.removeUser();
    token = '';
    user = null;
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:itax/config/user_secure_storage.dart';
// import 'package:itax/models/business_model.dart';
// import 'package:itax/models/new_user_model.dart';

// class AuthProvider with ChangeNotifier {
//   final String baseUrl = 'https:/ /api.itaxeasy.com';

//   String _otpId = '';
//   String _email = '';
//   String _password = '';
//   String _token = '';
//   NewUserModel? _user;
//   final String _otp = '';
//   BusinessModel? _business;

//   // Getters for the private fields
//   String get email => _email;
//   String get token => _token;
//   NewUserModel? get user => _user;
//   BusinessModel? get business => _business;
//   bool _isLoading = false;
//   String? _errorMessage;

//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   // Private methods to update state and notify listeners
//   void _setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }

//   void _setError(String? message) {
//     _errorMessage = message;
//     notifyListeners();
//   }

//   Future<void> login(String email, String password) async {
//     _setLoading(true);
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/user/login'),
//         body: json.encode({"email": email, "password": password}),
//         headers: {'Content-Type': 'application/json'},
//       );
//       print(response);

//       final jsonResponse = jsonDecode(response.body);
//       print(jsonResponse);
//       if (response.statusCode == 200) {
//         final userData = jsonResponse['data']['user'];
//         _otpId = userData['id'].toString();
//         _email = userData['email'];
//         _token = jsonResponse['data']['token'];
        
//         // Store other user details as needed
//       } else {
//         throw Exception(jsonResponse['message']);
//       }
      
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }
//   Future<http.Response> generateForgotPasswordOTP(String email) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/user/forgot-password'),
//       body: json.encode({'email': email}),
//       headers: {'Content-Type': 'application/json'},
//     );

//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     final jsonResponse = jsonDecode(response.body);

//     if (response.statusCode < 200 || response.statusCode >= 300) {
//       throw http.ClientException(
//           'Could not generate OTP: ${jsonResponse['message']}');
//     }

//     final otpId = jsonResponse['otp_key'].toString();
//     _otpId = otpId;
//     _email = email;

//     return response;
//   }

//   Future<void> verifyOTP(String otp) async {
//     _setLoading(true);
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/user/verify-otp'),
//         body: json.encode({"otp": otp, "id": _otpId}),
//         headers: {'Content-Type': 'application/json'},
//       );

//       final jsonResponse = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         _token = jsonResponse['results']['data']['token'];
//         await UserSecureStorage.saveUser(_user!, _token);
//       } else {
//         throw Exception(jsonResponse['message']);
//       }
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   Future<void> signUp(NewUserModel user) async {
//     _setLoading(true);
//     try {
//       print('sign up started');
//       final response = await http.post(
//         Uri.parse('$baseUrl/user/sign-up'),
//        body: json.encode({
//           "firstName": user.firstName ?? '',
//           "lastName": user.lastName ?? '',
//           "phone": user.phone ?? '',
//           "email": user.email ?? '',
//           "password": user.password ?? '',
//           "pin": user.pincode ?? '',
//           "gender": user.gender ?? 'male',
//           "aadhar": user.aadhaar ?? '',
//           "pan": user.pan ?? '',
//           "address": user.address ?? '',
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );

//       final jsonResponse = jsonDecode(response.body);
//       print(jsonResponse);
//       if (response.statusCode == 200 && jsonResponse['success'] == true) {
//         _otpId = jsonResponse['data']['otp_key']?.toString() ?? '';
//         _email = user.email ?? '';
//         _password = user.password ?? '';
//       } else {
//         throw Exception(jsonResponse['message'] ?? 'Sign-up failed');
//       }
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   Future<void> loadUser() async {
//     _setLoading(true);
//     try {
//       final userData = await UserSecureStorage.getUser();
//       if (userData == null) return;

//       final response = await http.get(
//         Uri.parse('$baseUrl/user/profile'),
//         headers: {'Authorization': 'Bearer $_token'},
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body)['data'];
//         _user = NewUserModel(
//           firstName: data['firstName'] ?? '',
//           lastName: data['lastName'] ?? '',
//           email: data['email'],
//           phone: data['phone'],
//           aadhaar: data['aadhaar'] ?? '',
//           pan: data['pan'] ?? '',
//           dob: data['dob'] ?? '',
//           gender: data['gender'] ?? '',
//           fatherName: data['fatherName'] ?? '',
//         );
//         UserSecureStorage.saveUser(_user!, _token);
//       } else {
//         _user = null;
//       }
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   Future<void> loadBusiness() async {
//     _setLoading(true);
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/user/get-bussiness-details'),
//         headers: {'Authorization': 'Bearer $_token'},
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body)['data'];
//         _business = BusinessModel.fromJson(data);
//       } else {
//         throw Exception('Failed to load business details');
//       }
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }

//   Future<void> clearUser() async {
//     _setLoading(true);
//     try {
//       await UserSecureStorage.removeUser();
//       _user = null;
//       _token = '';
//       notifyListeners();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }
// }
