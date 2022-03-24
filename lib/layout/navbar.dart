import 'package:flutter/material.dart';
import './breadcrumb.dart';
import './navbarUser.dart';

class Navbar extends StatefulWidget {
  final Function()? onMenu;
  const Navbar({Key? key, this.onMenu}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color.fromRGBO(238, 238, 238, 1),
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              widget.onMenu?.call();
            },
            child: const Icon(Icons.menu),
          ),
          const SizedBox(width: 20),
          const Breadcrumb(),
          const Spacer(flex: 1),
          const NavbarUser(),
        ],
      ),
    );
  }
}
