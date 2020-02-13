import 'package:bankly_task/main.dart';
import 'package:flutter/material.dart';

import 'WidgetsFormHelper/dismiss_keyboard_on_scroll.dart';
import 'WidgetsFormHelper/lostpassworddialog.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor("#0bc0c2"),
        title: Text("LOGIN"),
        centerTitle: true,
        elevation: 4.0,
      ),
      resizeToAvoidBottomPadding: false,
      body: DismissKeyboardOnScroll(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                      child: Text('Welcome back.',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: hexToColor("#0bc0c2"))),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 90.0, 0.0, 0.0),
                      child: Text('Please sign in to continue',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: hexToColor("#0bc0c2")))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        hexToColor("#0bc0c2").withAlpha(800)))),
                        obscureText: true,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password? Click here ',
                            style: TextStyle(
                                color: hexToColor("#0bc0c2"),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            showLostPasswordDialog(context);
                          },
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                'dashboard', (Route<dynamic> route) => false);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  hexToColor("#0bc0c2"),
                                  hexToColor("#29ced1")
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),

//                    Material(
//                      borderRadius: BorderRadius.circular(20.0),
//                      shadowColor: Colors.blue[800],
//                      color: Colors.blue[800],
//                      elevation: 7.0,
//                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.of(context).pushNamed('/dashboard');
//                        },
//                        child: Center(
//                          child: Text(
//                            'LOGIN',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: 'Montserrat'),
//                          ),
//                        ),
//                      ),
//                    ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New user ?',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('signup');
                    },
                    child: Text(
                      'Signup here',
                      style: TextStyle(
                          color: hexToColor("#29ced1"),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40.0),
            ]),
          )
        ],
      )),
    );
  }
}
