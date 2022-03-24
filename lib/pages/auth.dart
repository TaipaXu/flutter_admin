import 'package:flutter/material.dart';
import '/store/user.dart' as store;
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final store.User user = context.watch<store.User>();
    bool isAdmin = user.user!.permissions != null &&
        user.user!.permissions!.contains('admin');
    bool isNormal = user.user!.permissions != null &&
        user.user!.permissions!.contains('normal');

    return Material(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              MaterialButton(
                color: Theme.of(context).primaryColor,
                disabledColor: Theme.of(context).primaryColor.withOpacity(0.8),
                onPressed: isAdmin
                    ? null
                    : () {
                        store.user.setPermissions(['admin']);
                      },
                child: const Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              MaterialButton(
                color: Theme.of(context).primaryColor,
                disabledColor: Theme.of(context).primaryColor.withOpacity(0.8),
                onPressed: isNormal
                    ? null
                    : () {
                        store.user.setPermissions(['normal']);
                      },
                child: const Text(
                  'Normal',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Offstage(
            offstage:
                Provider.of<store.User>(context).user!.permissions == null,
            child: Wrap(
              children: [
                for (String permission
                    in Provider.of<store.User>(context).user!.permissions!)
                  Chip(label: Text(permission))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
