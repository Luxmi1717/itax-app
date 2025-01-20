
import 'dart:convert';

import 'dart:io';



import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:itax/config/user_secure_storage.dart';
import 'package:itax/providers/services-old/app_exceptions.dart';


import 'baseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiServies extends BaseApiServices{
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? authToken;

  @override



  final userData =  UserSecureStorage.getUser();

  @override
  Future GetApiResponse(String url) async {
   String? authToken = await storage.read(key: 'user');
    final userData =  await UserSecureStorage.getUser();
      authToken=userData!['token'];
      print(authToken.toString());


    dynamic responseJson;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
      // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZmlyc3ROYW1lIjoiSGFyc2giLCJsYXN0TmFtZSI6IlNpbmdoIiwiYWRkcmVzcyI6bnVsbCwiYWFkaGFhciI6IjEyMjM0NDUiLCJwYW4iOiIxMTIyMyIsImVtYWlsIjoiaGFyc2hzaW5naC5qc0BnbWFpbC5jb20iLCJwaG9uZSI6IjEyMjM0NTY3NzgiLCJwaW4iOiIxMTIyMyIsInVzZXJUeXBlIjoiYWRtaW4iLCJ2ZXJpZmllZCI6dHJ1ZSwiY3JlYXRlZEF0IjoiMjAyMy0wOS0yNFQxMToxMDoxMy4xNjBaIiwiaWF0IjoxNjk2MjcyMzk3LCJleHAiOjE3Mjc4Mjk5OTcsImlzcyI6ImlUYXhFYXN5In0.ivPaN9xdaD2dtkmSgeTWsuBhUG_eUUhSPgrVtJ_F7Yc',
    };

    try{
      final response=await  http.get(
        Uri.parse(url),
        headers: headers,
      );
      print('hello');
      print(response.body);

      responseJson=returnResponse(response);
    }on SocketException {
      throw FatchDataException('No Internet connection');

    }
    print(responseJson);

    return responseJson;

  }
  @override


  Future GetApiResponse2(String url) async {


    print('getapi');
    dynamic responseJson;
    try{
      final response=await http.get(
        Uri.parse(url),
      );
      print('hello');
      print(response.body);
      responseJson=returnResponse(response);
    }on SocketException {
      throw FatchDataException('No Internet connection');
    }
    print(responseJson);
    return responseJson;
  }
  @override
  Future postApiResponse(String url,dynamic data) async {
    //String? authToken = await storage.read(key: "token");
    final userData =  await UserSecureStorage.getUser();
    authToken=userData!['token'];
    print(authToken.toString());

    dynamic responseJson;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    final body = jsonEncode(data);

    try{
      final response = await http.post(Uri.parse(url),  body:body,
        headers: headers,);
      print(response.statusCode);
      print(response.body);
      responseJson=returnResponse(response);
    }on SocketException {
      throw FatchDataException(' No Internet connection');

    }
    return responseJson;

  }
  @override
  Future postApiResponse2(String url,dynamic data) async {


    dynamic responseJson;
    final headers =
    {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode(data);

    try{
      final response = await http.post(Uri.parse(url),  body:body,
        headers: headers,);
      print(response.statusCode);
      print(response.body);
      responseJson=returnResponse(response);
    }on SocketException {
      throw FatchDataException(' No Internet connection');

    }
    return responseJson;

  }
  dynamic returnResponse (http.Response reponse){
    switch(reponse.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(reponse.body);
        return responseJson;

      case 201:
        dynamic responseJson=jsonDecode(reponse.body);
        return responseJson;

      case 400:
        throw BadRequestException(reponse.body);
      case 404:
        throw UnathorisedException(reponse.body);
      default:
        throw FatchDataException('Error accurred while communicating with serverwith status code${reponse.statusCode}');


    }
  }
  
}