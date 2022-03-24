import 'package:flutter/material.dart';
import '/router/routes.dart';
import './sidebarItem.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff343a40),
      width: 200,
      child: ListView(
        children: [
          for (var route in routes)
            SidebarItem(
              view: route,
            ),
        ],
      ),
    );
  }
}
