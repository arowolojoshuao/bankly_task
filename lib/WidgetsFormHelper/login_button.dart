import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: appButton(
          btnTxt: "Log In",
          onBtnclicked: onPressed,
          btnPadding: 10.0,
          btnColor: Colors.white),
    );
  }
}

Widget appButton(
    {String btnTxt,
    double btnPadding,
    Color btnColor,
    VoidCallback onBtnclicked}) {
  btnTxt == null ? btnTxt == "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.all(btnPadding),
    child: new RaisedButton(
//      splashColor: hexToColor("#517a20"),
      color: Colors.blue[800],
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
      onPressed: onBtnclicked,
      child: Container(
        height: 50.0,
        child: new Center(
          child: new Text(
            btnTxt,
            style: new TextStyle(color: btnColor, fontSize: 18.0),
          ),
        ),
      ),
    ),
  );
}
