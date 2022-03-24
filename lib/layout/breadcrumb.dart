import 'package:flutter/material.dart';
import '/store/route.dart' as store;
import '/models/baseView.dart' as model;
import 'package:provider/provider.dart';

class Breadcrumb extends StatefulWidget {
  const Breadcrumb({Key? key}) : super(key: key);

  @override
  _BreadcrumbState createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  List<Widget> _items() {
    final store.Route route = context.watch<store.Route>();

    model.BaseView? currentRoute = route.currentRoute;
    List<Widget> items = [];
    if (currentRoute != null) {
      List<model.BaseView> routes = [];
      void insertView(model.BaseView view) {
        routes.insert(0, view);
        if (view.parent != null) {
          insertView(view.parent!);
        }
      }

      insertView(currentRoute);

      for (var i = 0; i < routes.length; i++) {
        final model.BaseView view = routes[i];
        items.add(Text(view.title));
        if (i < routes.length - 1) {
          items.add(const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text('/'),
          ));
        }
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _items(),
    );
  }
}
