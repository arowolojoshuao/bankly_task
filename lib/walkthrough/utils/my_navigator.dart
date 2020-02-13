import 'package:flutter/material.dart';

class MyNavigator {
  static void goToIntro(BuildContext context) {
    Navigator.pushReplacementNamed(context, "intro");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, "login");
  }

  static void goToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, "signup");
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "dashboard");
  }

//  Navigator.of(context).pushReplacement(
//  MaterialPageRoute(builder: (BuildContext context) => new Signup()));
//}

}
