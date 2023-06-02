import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static Future<void> save(String id, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString("id", id);
    await preferences.setString("token", token);
  }

  static Future<bool> hasToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var value = preferences.getString("token");

    return value != null;
  }

  static Future<void> deleteAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.clear();
  }

  static Future<String?> getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? id = preferences.getString('id');
    return id;
  }

  static Future<String?> getname() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? role = preferences.getString("name");
    return role;
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? token = preferences.getString("token");
    return token;
  }
}
