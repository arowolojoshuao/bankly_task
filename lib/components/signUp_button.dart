import 'package:bankly_task/WidgetsFormHelper/login_button.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  SignUpButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: appButton(
          btnTxt: "Sign Up",
          onBtnclicked: onPressed,
          btnPadding: 20.0,
          btnColor: Colors.white),
    );
  }
}
