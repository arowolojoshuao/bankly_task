import 'package:bankly_task/dashboard.dart';
import 'package:bankly_task/login.dart';
import 'package:bankly_task/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static String initialRoute = 'login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'signup':
        return MaterialPageRoute(builder: (_) => SignupPage());
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
