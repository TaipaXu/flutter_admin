import 'package:flutter/material.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';

class Markdown extends StatefulWidget {
  const Markdown({Key? key}) : super(key: key);

  @override
  _MarkdownState createState() => _MarkdownState();
}

class _MarkdownState extends State<Markdown> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print(_controller.text);
      // print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MarkdownFormField(
        controller: _controller,
        enableToolBar: true,
        emojiConvert: true,
        autoCloseAfterSelectEmoji: false,
      ),
    );
  }
}
