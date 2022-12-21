import 'package:flutter/material.dart';
import 'package:my_need/core/app_router/routes.dart';

import '../keys.dart';

class NavigationService {
  static Future<dynamic> push<T extends Object?>(String route,
      {dynamic arguments}) async {
    return await Keys.navigationKey.currentState!.pushNamed(
      route,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushReplacementNamed<T extends Object>(
    String route, {
    dynamic arguments,
  }) async {
    return await Keys.navigationKey.currentState!.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil<T extends Object>(String route,
      {dynamic arguments,
      String? oldRoute = Routes.login,
      bool? isClean = false}) async {
    return await Keys.navigationKey.currentState!.pushNamedAndRemoveUntil(
      route,
      (old) => (isClean! ? false : (old.settings.name == oldRoute)),
      arguments: arguments,
    );
  }

  static void popUntil(
    String route, {
    dynamic arguments,
  }) {
    return Keys.navigationKey.currentState!
        .popUntil(ModalRoute.withName(route));
  }

  static void pop({dynamic data}) {
    if (Keys.navigationKey.currentState!.canPop()) {
      Keys.navigationKey.currentState!.pop(data);
    }
  }
}
