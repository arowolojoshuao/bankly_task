import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final String emailError;

  EmailField({this.emailController, this.emailError});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.only(left: 14.0, right: 14.0),
        child: new
        Theme(
            data: new ThemeData(
                primaryColor: Theme.of(context).primaryColor,
                textSelectionColor: Theme.of(context).primaryColor),

            child: new TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  errorText: emailError,
                  prefixIcon: new Container(
                    child: Icon(Icons.email),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                  labelText: 'Email Address',
                ))
            ));
  }
}
