import 'package:flutter/material.dart';

class Dialog extends StatefulWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Flutter Admin',
      applicationVersion: 'Version',
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Title'),
        content: const Text('Content'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text('Title'),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, right: 30, bottom: 10, left: 30),
            child: Text('Content'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SimpleDialogOption(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
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
              onPressed: _showAboutDialog,
              child: const Text(
                'About Dialog',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: _showAlertDialog,
              child: const Text(
                'Alert Dialog',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: _showSimpleDialog,
              child: const Text(
                'Simple Dialog',
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
