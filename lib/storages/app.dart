import 'package:x_shared/x_shared.dart';
import '/models/user.dart' as model;

class App {
  static String? token;
  static bool? showSidebar;
  static String? lastAccount;

  static Future<String?> getToken() async {
    XShared xShared = await XShared.getInstance();
    String? token = xShared.get<String>('token');
    return token;
  }

  static Future<void> setToken(String token) async {
    XShared xShared = await XShared.getInstance();
    await xShared.set('token', token);
  }

  static Future<String?> getLastAccount() async {
    XShared xShared = await XShared.getInstance();
    String? account = xShared.get<String>('account');
    return account;
  }

  static Future<void> setLastAccount(String account) async {
    XShared xShared = await XShared.getInstance();
    await xShared.set('account', account);
  }

  static Future<model.User?> getUser() async {
    XShared xShared = await XShared.getInstance();
    model.User? user = xShared.get<model.User>('user');
    return user;
  }

  static Future<void> setUser(model.User user) async {
    XShared xShared = await XShared.getInstance();
    await xShared.set<model.User>('user', user);
  }

  static Future<void> logout() async {
    XShared xShared = await XShared.getInstance();
    await xShared.remove('token');
    await xShared.remove('user');
  }
}
