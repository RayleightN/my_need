import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData mnThemeData(BuildContext context) => ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xffFF9500),
      unselectedWidgetColor: const Color(0xffC7C7C7),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'SVN',
      cupertinoOverrideTheme:
          const CupertinoThemeData(textTheme: CupertinoTextThemeData()),
      textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
          fontFamily: 'SVN'),
    );
