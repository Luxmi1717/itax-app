import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserSecureStorage {
  static const storage = FlutterSecureStorage();

  static saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');
    return token;
  }



  static removeToken() async {
    await storage.delete(key: 'token');
  }

  static Future<Map<String, dynamic>?> getDataFromToken() async {
    String? token = await UserSecureStorage.getToken();

    if (token == null) {
      return null;
    }

    Map<String, dynamic> data = JwtDecoder.decode(token);

    return data;
  }
}
