import 'package:flutter/material.dart';

class Tools {
  static showSnacBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

//  static showSnackBar(String message, final scaffoldKey) {
//    scaffoldKey.currentState.showSnackBar(new SnackBar(
//      backgroundColor: Colors.red[600],
//      content: new Text(
//        message,
//        style: new TextStyle(color: Colors.white),
//      ),
//    ));
//  }

  static showSnackBarSuccess(String message, final scaffoldKey) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.green[600],
      content: new Text(
        message,
        style: new TextStyle(color: Colors.white),
      ),
    ));
  }

  TextStyle extraData() {
    return new TextStyle(
        color: Colors.white70, fontStyle: FontStyle.normal, fontSize: 17.0);
  }

  TextStyle tempStyle() {
    return new TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 49.9);
  }

  static void showTapMessage(BuildContext context, String msg) {
    var alert = new AlertDialog(
      title: Text("You have Successfully Logged In"),
      content: Text(msg),
      actions: <Widget>[
        FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
