import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class RichText extends StatefulWidget {
  const RichText({Key? key}) : super(key: key);

  @override
  _RichTextState createState() => _RichTextState();
}

class _RichTextState extends State<RichText> {
  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print(_controller.plainTextEditingValue);
      // print(_controller.document);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(200, 200, 200, 1),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 2),
            QuillToolbar.basic(controller: _controller),
            const Divider(height: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
