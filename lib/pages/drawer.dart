import 'package:flutter/material.dart';

class Drawer extends StatefulWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                _scaffoldkey.currentState?.openEndDrawer();
              },
              child: const Text(
                'Drawer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        width: 200,
        height: double.infinity,
        child: const Text('Drawer'),
      ),
    );
  }
}
