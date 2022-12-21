import 'package:flutter/material.dart';

class Keys {
  static final navigationKey = GlobalKey<NavigatorState>();

  static BuildContext? getContext() {
    return navigationKey.currentContext;
  }
}
