import 'dart:convert';

import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyTokenApi = 'token_api';
  static const _user = 'user';

  static Future setAccessToken(String accessToken) async {
    await _storage.write(key: _keyTokenApi, value: accessToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyTokenApi);
  }

  static Future setUser(DataUser? user) async {
    await _storage.write(key: _user, value: jsonEncode(user?.toJson()));
  }

  static Future<DataUser?> getUser() async {
    try {
      var jsonString = await _storage.read(key: _user);
      if (jsonString != null) {
        DataUser user = DataUser.fromJson(jsonDecode(jsonString));
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
