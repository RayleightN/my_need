import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_need/core/keys.dart';
import 'package:my_need/core/app_router/route_generator.dart';
import 'package:my_need/core/app_router/routes.dart';

import 'core/theme.dart';

Future<void> main() async {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const RootApp());
  }, (error, stack) {});
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_need',
      theme: mnThemeData(context),
      navigatorKey: Keys.navigationKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
