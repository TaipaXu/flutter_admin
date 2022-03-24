import 'package:x_shared/x_shared.dart';

class Token {
  static String? token;

  static Future<String?> getToken() async {
    XShared xShared = await XShared.getInstance();
    String? token = xShared.get<String>('token');
    return token;
  }

  static Future<void> setToken(String token) async {
    XShared xShared = await XShared.getInstance();
    await xShared.set('token', token);
  }

  static Future<void> removeToken() async {
    XShared xShared = await XShared.getInstance();
    await xShared.remove('token');
  }
}
