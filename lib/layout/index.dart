import 'package:flutter/material.dart';
import '/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:x_responsive/x_responsive.dart';
import '/router/navigatorKey.dart' as global;
import '/store/app.dart' as store;
import '/store/route.dart' as store;
import './sidebar.dart';
import './navbar.dart';
import './tags.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  store.Route? route;

  @override
  void initState() {
    super.initState();

    context.read<store.Route>().addListener(_routeChange);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      store.route.setCurrentRoute(dashboard);
      store.route.addVisitedRoute(dashboard);
    });
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    route = context.read<store.Route>();
  }

  @override
  void dispose() {
    route!.removeListener(_routeChange);

    super.dispose();
  }

  void _routeChange() {
    print('change');
    if (_scaffoldkey.currentState?.isDrawerOpen == true) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final store.App app = context.watch<store.App>();

    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Offstage(
              offstage: !app.showSidebar ||
                  Condition.screenDown(Breakpoint.sm).check(context),
              child: const Sidebar(),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Navbar(
                    onMenu: () {
                      if (Condition.screenDown(Breakpoint.sm).check(context)) {
                        _scaffoldkey.currentState?.openDrawer();
                      } else {
                        app.toggleSidebar();
                      }
                    },
                  ),
                  const Tags(),
                  Expanded(
                    child: MaterialApp(
                      navigatorKey: global.frameNavigatorKey,
                      debugShowCheckedModeBanner: false,
                      home: dashboard.page,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Responsive.condition(
        condition: Condition.screenDown(Breakpoint.sm),
        child: const Sidebar(),
      ),
    );
  }
}
