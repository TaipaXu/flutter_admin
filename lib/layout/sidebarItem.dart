import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/router/navigatorKey.dart' as global;
import '/models/baseView.dart' as model;
import '/models/groupView.dart' as model;
import '/models/innerView.dart' as model;
import '/models/effectiveView.dart' as model;
import '/store/route.dart' as store;
import '/store/user.dart' as store;

class SidebarItem extends StatefulWidget {
  final model.BaseView view;

  const SidebarItem({Key? key, required this.view}) : super(key: key);

  @override
  _SidebarItemState createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  model.GroupView? _expandedGroup;

  Widget _getGroupView(model.GroupView view) {
    List<Widget> children = [];
    for (var child in view.children) {
      children.add(SidebarItem(view: child));
    }
    return Column(children: [
      InkWell(
        onTap: () {
          setState(() {
            if (_expandedGroup == view) {
              _expandedGroup = null;
            } else {
              _expandedGroup = view;
            }
          });
        },
        child: _getItem(view),
      ),
      AnimatedSize(
        duration: const Duration(milliseconds: 180),
        child: SizedBox(
          height: _expandedGroup == view ? null : 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _getEffectiveView(model.EffectiveView view) {
    return Offstage(
      offstage: !_hasPermission(view),
      child: InkWell(
        onTap: () {
          if (view is model.InnerView) {
            store.route.setCurrentRoute(view);
            store.route.addVisitedRoute(view);
            Navigator.of(global.getFrameContext()).push(
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => view.page,
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: const Duration(
                  milliseconds: 200,
                ),
              ),
            );
          }
        },
        child: _getItem(view),
      ),
    );
  }

  Widget _getItem(model.BaseView view) {
    return ListTile(
      title: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            view.icon == null
                ? const SizedBox(
                    width: 10,
                  )
                : IconTheme(
                    data: const IconThemeData(
                      color: Colors.grey,
                      size: 14,
                    ),
                    child: view.icon!),
            const SizedBox(
              width: 6,
            ),
            Text(
              view.title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      trailing: view is model.GroupView
          ? Icon(
              _expandedGroup == view
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_left,
              color: Colors.grey,
            )
          : null,
    );
  }

  bool _hasPermission(model.EffectiveView view) {
    final store.User user = context.watch<store.User>();
    if (user.user?.permissions != null &&
        user.user!.permissions!.contains('admin')) {
      return true;
    } else if (view.permission == null) {
      return true;
    } else if (user.user!.permissions!.contains(view.permission)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return widget.view is model.GroupView
        ? _getGroupView(widget.view as model.GroupView)
        : _getEffectiveView(widget.view as model.EffectiveView);
  }
}
