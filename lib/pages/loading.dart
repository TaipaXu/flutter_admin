import 'package:flutter/material.dart';
import 'package:x_message/x_message.dart' as x;
import '/router/navigatorKey.dart' as global;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _startLoading() async {
    final loading = x.Loading(
      context: global.getFrameContext(),
    );
    loading.show();
    await Future.delayed(const Duration(seconds: 2));
    loading.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: _startLoading,
              child: const Text(
                'Fullscreen Loading',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
