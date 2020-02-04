import 'dart:async';

import 'package:flutter/material.dart';

import 'materialflatbutton.dart';

// FIXME this view would need some proper MVI
Future<String> showLostPasswordDialog(BuildContext context) async {
  final emailController = TextEditingController();

  return showDialog<String>(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(
        "Retrieve Password",
        style: const TextStyle(
          fontFamily: "Google Sans",
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Text(
                "Enter your login email and we'll send you instructions to reset your password",
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16.0)),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const Padding(padding: EdgeInsets.only(top: 25.0)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialFlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: "Cancel",
              textColor: Theme.of(context).textTheme.title.color,
            ),
            MaterialFlatButton.primary(
              context: context,
              onPressed: () {
                if (emailController.value.text.trim().isEmpty) {
                  _showEmptyEmailDialog(context);
                  return;
                }

                Navigator.of(context).pop(emailController.value.text);
              },
              text: "Reset password",
            ),
            const Padding(padding: EdgeInsets.only(right: 8.0)),
          ],
        ),
      ],
    ),
  );
}

_showEmptyEmailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Empty Email",
        style: const TextStyle(
          fontFamily: "Google Sans",
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        "Please provide an email",
        style: const TextStyle(
          fontSize: 15.0,
        ),
      ),
      actions: <Widget>[
        MaterialFlatButton.primary(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: "OK",
        )
      ],
    ),
  );
}

showLostPasswordEmailSentSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      "Email with instructions has been send",
    ),
    duration: const Duration(seconds: 5),
  ));
}

showLostPasswordEmailErrorSendingSnackBar(BuildContext context, String error) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      "${"An error occurred while sending the email with instructions"} ($error)",
      style: TextStyle(
        color: Colors.red[600],
      ),
    ),
    duration: const Duration(seconds: 5),
  ));
}
