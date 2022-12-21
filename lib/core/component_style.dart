import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

platformIconBack(Color color) {
  return Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
      color: color, size: 24);
}

platformIconClose(Color color) {
  return Icon(Platform.isIOS ? Icons.close : Icons.close,
      color: color, size: 24);
}

var lightStatusBar = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: Colors.transparent,
);

var darkStatusBar = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.transparent,
);
