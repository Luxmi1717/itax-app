
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../repositories/user_secure_storage.dart';








class Api_call extends StatefulWidget {
  const Api_call({super.key});

  @override
  State<Api_call> createState() => _Api_callState();
}

class _Api_callState extends State<Api_call> {
  Map<String,dynamic>? doneListData;
  static const baseUrl = 'https://api.itaxeasy.com';
  login() async {

    final token = await UserSecureStorage.getToken();

      http.Response res = await http.post(
        Uri.parse('https://api.itaxeasy.com/users/create-business-profile'),

        headers: {
          'Content-Type':'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({

            "businessName":"govind",
            "bankAccountNo": "1236547895652",
            "companyPanNo":"fags1313hs",
            "companyTanNo":"hsahhsgdhrt2121",
            "msmeNo":"323232343",
            "gstNo":"aksg1223kkhkfjs",
            "bandDetails":"surrtfh",
            "incorporateCertificate":"certeify"
        }),
      );
      print(res.statusCode);

      if (res.statusCode == 409) {


        var data=jsonDecode(res.body);
        print(data);


      } else {
        print("Login failedy. Please try again");
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: () {
        login();
      }, child: const Text('hello world'),)


    );
  }
}
