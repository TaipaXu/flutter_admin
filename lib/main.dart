import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/config.dart' as config;
import '/router/navigatorKey.dart' as global;
import '/store/route.dart' as store;
import '/store/app.dart' as store;
import '/store/user.dart' as store;
import '/pages/splash.dart' as page;
import '/pages/login.dart' as page;
import '/layout/index.dart' as page;

void main() {
  const String env = String.fromEnvironment('env');
  if (env == 'dev') {
    config.load(config.Env.development);
  } else {
    config.load(config.Env.production);
  }

  runApp(const MyApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  store.initToken();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => store.route),
        ChangeNotifierProvider(create: (_) => store.app),
        ChangeNotifierProvider(create: (_) => store.user),
      ],
      child: Consumer3<store.Route, store.App, store.User>(
        // x_message must be used in Scaffold
        builder: (_, store.Route routeProvider, store.App appProvider,
                store.User userProvider, __) =>
            MaterialApp(
          home: Scaffold(
            body: MaterialApp(
              key: const ObjectKey('layout'),
              navigatorKey: global.mainNavigatorKey,
              routes: {
                '/': (context) => const page.Splash(),
                'login': (context) => const page.Login(),
                'layout': (context) => const page.Layout(),
              },
              initialRoute: '/',
              debugShowCheckedModeBanner: config.debugShowCheckedModeBanner,
            ),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
