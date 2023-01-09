import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_need/core/app_router/navigation_service.dart';
import 'package:my_need/core/app_router/routes.dart';
import 'package:my_need/core/widgets/full_width_button.dart';
import 'package:my_need/core/widgets/sized_box.dart';
import 'package:my_need/source/presentation/home/home_screen.dart';
import 'package:my_need/source/presentation/list_task/list_task_screen.dart';
import 'package:my_need/source/presentation/login/login_screen.dart';
import 'package:my_need/source/presentation/sign_up/sign_up_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case Routes.listTask:
      return pageBuilder(settings: settings, screen: const ListTaskScreen());
    case Routes.login:
      return pageBuilder(
          settings: settings,
          screen: LoginScreen(
            loginArgs: args is LoginArgs ? args : null,
          ));
    case Routes.signUp:
      return pageBuilder(settings: settings, screen: SignUpScreen());
    case Routes.home:
      return pageBuilder(settings: settings, screen: const HomeScreen());
    default:
      return _errorRoute(settings.name, args);
  }
}

dynamic pageBuilder({required RouteSettings settings, required Widget screen}) {
  return CupertinoPageRoute(builder: (context) => screen, settings: settings);
}

Route<dynamic> _errorRoute(String? router, dynamic error) {
  return MaterialPageRoute(builder: (_) {
    return ErrorScreen(routerError: router, error: error);
  });
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, this.routerError, this.error}) : super(key: key);
  final String? routerError;
  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Error Page'),
            heightBox10,
            MNFullWidthButton(
              title: 'Back',
              onPressed: () {
                NavigationService.pop();
              },
            ),
          ],
        ),
      )),
    );
  }
}
