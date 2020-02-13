import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController usernameController;
  final String usernameError;
  final String labetText;

  UsernameField({this.usernameController, this.usernameError, this.labetText});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.only(left: 14.0, right: 14.0),
        child: new Theme(
            data: new ThemeData(
                primaryColor: Theme.of(context).primaryColor,
                textSelectionColor: Theme.of(context).primaryColor),
            child: new TextField(
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  errorText: usernameError,
                  prefixIcon: new Container(
                    child: Icon(Icons.supervised_user_circle),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                  labelText: labetText,
                ))));
  }
}
