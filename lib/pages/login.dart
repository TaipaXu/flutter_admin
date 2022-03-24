import 'package:flutter/material.dart';
import 'package:x_responsive/x_responsive.dart';
import 'package:x_message/x_message.dart' as x;
import '/store/user.dart' as store;
import '/router/navigatorKey.dart' as global;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _account = 'admin';
  String _password = '123';
  bool _remember = false;

  @override
  initState() {
    super.initState();

    _accountController.text = _account;
    _passwordController.text = _password;
  }

  Future _login() async {
    final loading = x.Loading(
      context: global.getMainContext(),
    );
    loading.show();
    await Future.delayed(const Duration(seconds: 1));

    try {
      await store.user
          .login(account: _account, password: _password, remember: _remember);
      Navigator.of(global.getMainContext()).pushReplacementNamed('layout');
    } catch (e) {
    } finally {
      loading.hide();
    }
  }

  Widget _getForm() {
    final double? width =
        Condition.screenUp(Breakpoint.lg).check(context) ? 420 : null;

    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(5, 5),
            color: Colors.black.withAlpha(59),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text('Sign in to explore Flutter Admin'),
          const SizedBox(height: 40),
          TextField(
            controller: _accountController,
            onChanged: (String value) {
              _account = value;
            },
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            onChanged: (String value) {
              _password = value;
            },
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _remember,
                  onChanged: (value) => setState(() {
                    _remember = value!;
                  }),
                ),
              ),
              const SizedBox(width: 6),
              const Text('Remember me'),
              const Spacer(),
              SizedBox(
                width: 120,
                child: MaterialButton(
                  child: const Text('Login'),
                  onPressed: _login,
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffd2d6de),
      child: Column(
        children: [
          const SizedBox(height: 150),
          const Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 35),
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
          const SizedBox(height: 20),
          _getForm(),
        ],
      ),
    );
  }
}
