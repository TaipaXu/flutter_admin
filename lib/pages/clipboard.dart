import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;

class Clipboard extends StatefulWidget {
  const Clipboard({Key? key}) : super(key: key);

  @override
  _ClipboardState createState() => _ClipboardState();
}

class _ClipboardState extends State<Clipboard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.text = 'value';
  }

  void _read() async {
    final service.ClipboardData? data =
        await service.Clipboard.getData(service.Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      _controller.text = data.text!;
    }
  }

  void _write() {
    service.Clipboard.setData(service.ClipboardData(text: _controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            controller: _controller,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: _read,
                child: const Text(
                  'Read',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: _write,
                child: const Text(
                  'Write',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
