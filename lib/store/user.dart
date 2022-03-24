import 'package:flutter/material.dart';
import '/models/user.dart' as model;
import '/apis/user.dart' as user_api;
import '/storages/token.dart' as storage;

class User with ChangeNotifier {
  String? _token;
  model.User? _user;

  model.User? get user => _user;
  String? get token => _token;

  void setToken(String token) {
    _token = token;
  }

  void removeToken() {
    _token = null;
  }

  void setUser(model.User user) {
    _user = user;
  }

  void removeUser() {
    _user = null;
  }

  void setPermissions(List<String>? permissions) {
    assert(_user != null);

    _user?.permissions = permissions;
    notifyListeners();
  }

  Future<void> login(
      {required String account,
      required String password,
      required bool remember}) async {
    final response = await user_api.login(account: account, password: password);

    final String token = response['token'];
    setToken(token);
    storage.Token.setToken(token);

    final userInfo = response['info'];
    setUser(model.User(
      code: userInfo['code'],
      name: userInfo['name'],
      permissions: List<String>.from(userInfo['permissions']),
    ));
  }

  Future<void> getInfo() async {
    final response = await user_api.getInfo();
    setUser(model.User(
      code: response['code'],
      name: response['name'],
      permissions: List<String>.from(response['permissions']),
    ));
  }

  void logout() {
    removeToken();
    removeUser();
    storage.Token.removeToken();
  }
}

final User user = User();

Future<void> initToken() async {
  String? token = await storage.Token.getToken();
  if (token != null) {
    user.setToken(token);
  }
}
