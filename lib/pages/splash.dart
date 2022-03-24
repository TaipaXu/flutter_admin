import 'dart:async';
import 'package:flutter/material.dart';
import '/store/user.dart' as store;
import '/storages/token.dart' as storage;
import '/router/navigatorKey.dart' as global;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Duration _duration = const Duration(seconds: 1);

  @override
  void initState() {
    _check();

    super.initState();
  }

  Future _check() async {
    await Future.delayed(_duration);
    String? token = await storage.Token.getToken();
    if (token != null) {
      try {
        await store.user.getInfo();
        Navigator.of(global.getMainContext()).pushReplacementNamed('layout');
      } catch (e) {
        store.user.removeToken();
        storage.Token.removeToken();
        Navigator.of(global.getMainContext()).pushReplacementNamed('login');
      }
    } else {
      Navigator.of(global.getMainContext()).pushReplacementNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffd2d6de),
      child: Column(
        children: const [
          SizedBox(height: 150),
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 35, color: Colors.white),
              children: [
                TextSpan(text: 'Flutter '),
                TextSpan(
                  text: 'Admin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
