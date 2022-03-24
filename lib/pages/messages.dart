import 'package:flutter/material.dart';
import 'package:x_message/x_message.dart' as x;
import '/router/navigatorKey.dart' as global;

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  void _toast() {
    x.Toast(
      context: global.getFrameContext(),
      message: 'Toast',
    );
  }

  void _message() {
    x.Message(
      context: global.getFrameContext(),
      message: 'Message',
    );
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
              onPressed: _toast,
              child: const Text(
                'Toast',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: _message,
              child: const Text(
                'Message',
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
