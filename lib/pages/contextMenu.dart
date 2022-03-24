import 'dart:io';
import 'package:flutter/material.dart';
import '/router/navigatorKey.dart' as global;

enum _Type {
  a,
  b,
  c,
  d,
}

class ContextMenu extends StatefulWidget {
  const ContextMenu({Key? key}) : super(key: key);

  @override
  _ContextMenuState createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  Future<void> _onPointerDown(PointerDownEvent event) async {
    bool show = false;
    if (Platform.isAndroid || Platform.isIOS) {
      if (event.original?.buttons == 1) {
        show = true;
      }
    } else {
      if (event.original?.buttons == 2) {
        show = true;
      }
    }

    if (show) {
      final _Type? result = await showMenu<_Type>(
        context: global.getMainContext(),
        position: RelativeRect.fromLTRB(event.position.dx, event.position.dy,
            event.position.dx, event.position.dy),
        items: [
          const PopupMenuItem(
            child: Text('Menu A'),
            value: _Type.a,
          ),
          const PopupMenuItem(
            child: Text('Menu B'),
            value: _Type.b,
          ),
          const PopupMenuItem(
            child: Text('Menu C'),
            value: _Type.c,
          ),
          const PopupMenuItem(
            child: Text('Menu D'),
            value: _Type.d,
          ),
        ],
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            Listener(
              onPointerDown: _onPointerDown,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
