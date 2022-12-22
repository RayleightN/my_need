import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_need/core/app_router/navigation_service.dart';
import 'package:my_need/core/keys.dart';
import 'package:my_need/core/app_router/route_generator.dart';
import 'package:my_need/core/app_router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_need/source/injector.dart';
import 'core/theme.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    setupLocator();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print(user.uid);
      } else {
        NavigationService.popUntil(Routes.login);
      }
    });
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        NavigationService.popUntil(Routes.login);
      } else {
        user.getIdToken().then((String token) {
          print('The user ID token is' + token);
        });
      }
    });
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
