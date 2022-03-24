import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import '/store/route.dart' as store;
import '/models/effectiveView.dart' as model;
import '/models/innerView.dart' as model;
import '/router/navigatorKey.dart' as global;
import './tag.dart';
import '/pages/dashboard.dart' as page;
import '/router/routes.dart';

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final ScrollController _listController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      double delta = event.scrollDelta.dy;
      // delta *= 3;
      double current = _listController.offset.toDouble() + delta;
      double future;
      if (delta >= 0) {
        future = min<double>(current, _listController.position.maxScrollExtent);
      } else {
        future = max(current, 0);
      }
      _listController.jumpTo(future);
    }
  }

  void _onTagTap(model.EffectiveView view) {
    if (view is model.InnerView) {
      store.route.setCurrentRoute(view);
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
  }

  void _removeView(model.EffectiveView view) {
    store.route.removeVisitenRoute(view);
    if (store.route.visitedRoutes.isNotEmpty) {
      if (store.route.currentRoute == view) {
        model.EffectiveView last = store.route.visitedRoutes.last;
        if (last is model.InnerView) {
          store.route.setCurrentRoute(store.route.visitedRoutes.last);
          Navigator.of(global.getFrameContext()).push(
            MaterialPageRoute(builder: (context) => last.page),
          );
        }
      } else {
        // model.EffectiveView? current = store.route.currentRoute;
        // if (current is model.InnerView) {
        //   Navigator.of(global.getFrameContext())
        //       .push(
        //     MaterialPageRoute(builder: (context) => current.page),
        //   );
        // }
      }
    } else {
      store.route.setCurrentRoute(dashboard);
      store.route.addVisitedRoute(dashboard);
      Navigator.of(global.getFrameContext()).push(
        MaterialPageRoute(builder: (context) => const page.Dashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final store.Route route = context.watch<store.Route>();

    return Listener(
      onPointerSignal: _onPointerSignal,
      child: Container(
        height: 35,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color.fromRGBO(238, 238, 238, 1),
            ),
          ),
        ),
        child: ListView(
          controller: _listController,
          padding: const EdgeInsets.fromLTRB(7, 4, 7, 4),
          scrollDirection: Axis.horizontal,
          children: [
            for (var item in route.visitedRoutes)
              Tag(
                view: item,
                active: store.route.currentRoute == item,
                onTap: () => _onTagTap(item),
                onRemove: () => _removeView(item),
              ),
          ],
        ),
      ),
    );
  }
}
