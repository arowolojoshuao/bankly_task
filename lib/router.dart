import 'package:bankly_task/Signup.dart';
import 'package:bankly_task/login.dart';
import 'package:bankly_task/onboard/onboarding_screen.dart';
import 'package:bankly_task/screens/homepage.dart';
import 'package:bankly_task/walkthrough/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static String initialRoute = 'login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'intro':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => HomePage());
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
