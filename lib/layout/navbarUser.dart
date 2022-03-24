import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/router/navigatorKey.dart' as global;
import '/store/route.dart' as store;
import '/store/user.dart' as store;

enum _Type {
  home,
  signOut,
}

class NavbarUser extends StatefulWidget {
  const NavbarUser({Key? key}) : super(key: key);

  @override
  _NavbarUserState createState() => _NavbarUserState();
}

class _NavbarUserState extends State<NavbarUser> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_Type>(
      child: const Icon(Icons.face),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_Type>>[
        const PopupMenuItem<_Type>(
          child: Text('Flutter admin'),
          value: _Type.home,
        ),
        const PopupMenuItem<_Type>(
          child: Text('Sign out'),
          value: _Type.signOut,
        ),
      ],
      onSelected: (_Type value) {
        switch (value) {
          case _Type.home:
            {
              launch('https://github.com/TaipaXu/flutter_admin');
              break;
            }
          case _Type.signOut:
            {
              store.user.logout();
              Navigator.of(global.getMainContext())
                  .pushReplacementNamed('login');
              store.route.removeAllRoutes();
              break;
            }
          default:
        }
      },
    );
  }
}
